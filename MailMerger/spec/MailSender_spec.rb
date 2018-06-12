require 'rspec' 
require_relative '../model/MailSender'
require_relative '../model/MailMerger'
require 'rack/test'
require 'json'

describe 'MailSender' do

  let(:mailSender) { MailSender.new }

  data = File.read('spec/data1.json')
  data = JSON.parse(data.to_s)
  data_json = JSON.parse(data.to_json)

  nombre_contacto = data_json['contactos'][0]['nombre']
  apellido_contacto = data_json['contactos'][0]['apellido']
  direccion_mail = data_json['contactos'][0]['mail']
  contacto = Contacto.new(nombre_contacto.capitalize, apellido_contacto.capitalize, direccion_mail)

  cuerpo = MailMerger.new.obtener_cuerpo_del_mail(data_json, contacto)
  origen = data_json['datos']['remitente']
  asunto = data_json['datos']['asunto']
  mail = Mail_.new(origen, asunto, contacto, cuerpo)
  
  it 'El Mailsender mockeado deberia enviar el mail con el origen, destino, asunto y cuerpo correctos' do
    mailSender = double
    allow(mailSender).to receive(:enviar_mail)
    expect(mailSender).to receive(:enviar_mail).with(mail)
    mailSender.enviar_mail(mail)
  end

  

end
