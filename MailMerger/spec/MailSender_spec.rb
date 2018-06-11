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
  cuerpo = MailMerger.new.obtener_cuerpo_del_mail(data_json, nombre_contacto)
  origen = data_json['datos']['remitente']
  destino = data_json['contactos'][0]['mail']
  asunto = data_json['datos']['asunto']
  
  it 'El Mailsender mockeado deberia enviar el mail con el origen, destino, asunto y cuerpo correctos' do
    mailSender = double
    allow(mailSender).to receive(:enviar_mail)
    expect(mailSender).to receive(:enviar_mail).with(origen, destino, asunto, cuerpo)
    mailSender.enviar_mail(origen, destino, asunto, cuerpo)
  end

  

end
