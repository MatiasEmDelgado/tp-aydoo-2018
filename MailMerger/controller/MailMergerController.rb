require_relative '../model/MailMerger'
require_relative '../model/MailSender'
require 'sinatra'
require 'sinatra/json'
require 'json'

post '/mail' do
  content_type :json	
  json = JSON.parse(request.body.read)
  origen = json['datos']['remitente']
  asunto = json['datos']['asunto']
  contactos = json['contactos']

  contactos.each do |contacto|
    nombre_contacto = JSON.parse(contacto.to_json)['nombre']
    destino = JSON.parse(contacto.to_json)['mail']
    cuerpo = MailMerger.new.obtener_cuerpo_del_mail(json, nombre_contacto)
    MailSender.new.enviar_mail(origen.to_s, destino.to_s, asunto.to_s, cuerpo.to_s)
  end
  status 200
  body({"resultado": "ok"}.to_json)
end
