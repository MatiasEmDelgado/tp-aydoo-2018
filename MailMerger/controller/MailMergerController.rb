require_relative '../model/MailMerger'
require_relative '../model/MailSender'
require_relative '../model/Mail'
require 'sinatra'
require 'sinatra/json'
require 'json'

post '/mailTest' do
  content_type :json	
  json = JSON.parse(request.body.read)
  origen = json['datos']['remitente']
  asunto = json['datos']['asunto']
  contactos = json['contactos']

  status 200
  body({"resultado": "ok"}.to_json)
end

post '/enviarMail' do
  begin
    content_type :json
    json = JSON.parse(request.body.read)


    contactos_en_el_json = json['contactos']
    origen = json['datos']['remitente']
    asunto = json['datos']['asunto']
    
    contactos_en_el_json.each do |contacto|

      nombre_contacto = JSON.parse(contacto.to_json)['nombre']
      apellido_contacto = JSON.parse(contacto.to_json)['apellido']
      direccion_mail = JSON.parse(contacto.to_json)['mail']
      contacto_actual = Contacto.new(nombre_contacto.capitalize, apellido_contacto.capitalize, direccion_mail)

      cuerpo = MailMerger.new.obtener_cuerpo_del_mail(json, contacto_actual)

      mail = Mail_.new(origen, asunto, contacto_actual, cuerpo)

      MailSender.new.enviar_mail(mail)

    end
    status 200
    body({"resultado": "ok"}.to_json)
  rescue
    status 500
    {"resultado" => "entrada incorrecta"}.to_json
  end
end
