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
    mail = Mail_.new(json.to_json)
  
    mail.contactos.each do |contacto|
      cuerpo = MailMerger.new.obtener_cuerpo_del_mail(json, contacto.nombre)
      MailSender.new.enviar_mail(mail.origen, contacto.mail, mail.asunto, cuerpo)
    end
    status 200
    body({"resultado": "ok"}.to_json)
  rescue
    status 500
    {"resultado" => "entrada incorrecta"}.to_json
  end
end
