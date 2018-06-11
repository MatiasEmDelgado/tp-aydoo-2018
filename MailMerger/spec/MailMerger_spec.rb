require 'rspec' 
require_relative '../model/MailMerger'
require 'rack/test'
require 'json'

describe 'MailMerger' do

  let(:mailMerger) { MailMerger.new }

  data = File.read('spec/data1.json')

  data = JSON.parse(data.to_s)
  

  data_json = JSON.parse(data.to_json)
  template = data_json['template']
  nombre_contacto = data_json['contactos'][0]['nombre']
  nombre_evento = data_json['datos']['nombre_evento']
  lugar_evento = data_json['datos']['lugar_del_evento']
  fecha_evento = data_json['datos']['fecha_del_evento']
  mail_de_confirmacion = data_json['datos']['mail_de_confirmacion']

  it 'El MailMerger deberia devolverme el cuerpo del mail para mandarselo a Juan' do

    cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail(data_json, nombre_contacto)
    expect(cuerpo_del_mail.include?'Hola Juan').to be_truthy
    expect(cuerpo_del_mail.include?'invitando a la cena de fin de año de la UNTREF').to be_truthy
    expect(cuerpo_del_mail.include?'en el Centro de estudios (avenida Directorio 887, Caseros)').to be_truthy
    expect(cuerpo_del_mail.include?'el día 5 de diciembre').to be_truthy
    expect(cuerpo_del_mail.include?'enviando un mail a fiesta@untref.com').to be_truthy
  end 

end
 