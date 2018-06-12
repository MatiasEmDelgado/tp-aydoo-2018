require 'rspec' 
require_relative '../model/MailMerger'
require 'rack/test'
require 'json'

describe 'MailMerger' do

  let(:mailMerger) { MailMerger.new }
  
  data = File.read('spec/data1.json')
  data = JSON.parse(data.to_s)
  data_json = JSON.parse(data.to_json)
  nombre_contacto = data_json['contactos'][0]['nombre']

  data_con_pais = File.read('spec/data3.json')
  data_con_pais = JSON.parse(data_con_pais.to_s)
  data_json_con_pais = JSON.parse(data_con_pais.to_json)
  nombre_contacto_con_pais = data_json_con_pais['contactos'][0]['nombre']

  data_fraude = File.read('spec/data4.json')
  data_fraude = JSON.parse(data_fraude.to_s)
  data_json_fraude = JSON.parse(data_fraude.to_json)
  nombre_contacto_con_denuncia = data_json_fraude['contactos'][0]['nombre']

  it 'El MailMerger deberia devolverme el cuerpo del mail para mandarselo a Juan' do

    cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail(data_json, nombre_contacto)
    expect(cuerpo_del_mail.include?'Hola Juan').to be_truthy
    expect(cuerpo_del_mail.include?'invitando a la cena de fin de año de la UNTREF').to be_truthy
    expect(cuerpo_del_mail.include?'en el Centro de estudios (avenida Directorio 887, Caseros)').to be_truthy
    expect(cuerpo_del_mail.include?'el día 5 de diciembre').to be_truthy
    expect(cuerpo_del_mail.include?'enviando un mail a fiesta@untref.com').to be_truthy
  end

  it 'El MailMerger deberia devolverme el cuerpo del segundo mail para mandarselo a Matu con el pais reemplazado' do

    cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail(data_json_con_pais, nombre_contacto_con_pais)
    expect(cuerpo_del_mail.include?'Hola Matu').to be_truthy
    expect(cuerpo_del_mail.include?'invitando a la copa del mundo').to be_truthy
    expect(cuerpo_del_mail.include?'en Jamaica').to be_truthy
    expect(cuerpo_del_mail.include?'el día 16 de Junio').to be_truthy
    expect(cuerpo_del_mail.include?'enviando un mail a fifa@fifa.com').to be_truthy
  end

  it 'El MailMerger deberia devolverme el cuerpo del segundo mail para mandarselo a un chaval que evadio impuestos' do
    string_con_hora_actual = 'a las ' + Time.now.strftime('%I:%M%p')
    cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail(data_json_fraude, nombre_contacto_con_denuncia)
    expect(cuerpo_del_mail.include?'Hola Chaval').to be_truthy
    expect(cuerpo_del_mail.include?'invitando a pagar').to be_truthy
    expect(cuerpo_del_mail.include?'en Argelia').to be_truthy
    expect(cuerpo_del_mail.include?'el día 5 de diciembre').to be_truthy
    expect(cuerpo_del_mail.include? string_con_hora_actual).to be_truthy
    
  end

end
 