require 'rspec' 
require_relative '../model/MailMerger'
require 'rack/test'
require 'json'

describe 'MailMerger' do

  let(:mailMerger) { MailMerger.new }
  
  data = File.read('./json_de_ejemplos/data1.json')
  data = JSON.parse(data.to_s)
  data_json = JSON.parse(data.to_json)
  nombre_contacto = data_json['contactos'][0]['nombre']
  apellido_contacto = data_json['contactos'][0]['apellido']
  direccion_mail = data_json['contactos'][0]['mail']
  contacto = Contacto.new(nombre_contacto.capitalize, apellido_contacto.capitalize, direccion_mail)

  data_con_pais = File.read('./json_de_ejemplos/data3.json')
  data_con_pais = JSON.parse(data_con_pais.to_s)
  data_json_con_pais = JSON.parse(data_con_pais.to_json)
  nombre_contacto_con_pais = data_json_con_pais['contactos'][0]['nombre']
  apellido_contacto_con_pais = data_json_con_pais['contactos'][0]['apellido']
  direccion_mail_contacto_con_pais = data_json_con_pais['contactos'][0]['mail']
  contacto_con_pais = Contacto.new(nombre_contacto_con_pais.capitalize, apellido_contacto_con_pais.capitalize, direccion_mail_contacto_con_pais)

  data_fraude = File.read('./json_de_ejemplos/data4.json')
  data_fraude = JSON.parse(data_fraude.to_s)
  data_json_fraude = JSON.parse(data_fraude.to_json)
  nombre_contacto_con_denuncia = data_json_fraude['contactos'][0]['nombre']
  apellido_contacto_con_denuncia = data_json_fraude['contactos'][0]['apellido']
  direccion_mail_contacto_con_denuncia = data_json_fraude['contactos'][0]['mail']
  contacto_con_denuncia = Contacto.new(nombre_contacto_con_denuncia.capitalize, apellido_contacto_con_denuncia.capitalize, direccion_mail_contacto_con_denuncia)

  data_suma = File.read('./json_de_ejemplos/data8.json')
  data_suma = JSON.parse(data_suma.to_s)
  data_json_suma = JSON.parse(data_suma.to_json)
  nombre_contacto_con_suma = data_json_suma['contactos'][0]['nombre']
  apellido_contacto_con_suma = data_json_suma['contactos'][0]['apellido']
  direccion_mail_contacto_con_suma = data_json_suma['contactos'][0]['mail']
  contacto_con_suma = Contacto.new(nombre_contacto_con_suma.capitalize, apellido_contacto_con_suma.capitalize, direccion_mail_contacto_con_suma)

  data_etiqueta_sin_valor = File.read('./json_de_ejemplos/data_con_etiqueta_sin_valor.json')
  data_etiqueta_sin_valor = JSON.parse(data_etiqueta_sin_valor.to_s)
  data_json_etiqueta_sin_valor = JSON.parse(data_etiqueta_sin_valor.to_json)
  nombre_contacto_con_etiqueta_sin_valor = data_json_etiqueta_sin_valor['contactos'][0]['nombre']
  apellido_contacto_con_etiqueta_sin_valor = data_json_etiqueta_sin_valor['contactos'][0]['apellido']
  direccion_mail_contacto_con_etiqueta_sin_valor = data_json_etiqueta_sin_valor['contactos'][0]['mail']
  contacto_con_etiqueta_sin_valor = Contacto.new(nombre_contacto_con_etiqueta_sin_valor.capitalize, apellido_contacto_con_etiqueta_sin_valor.capitalize, direccion_mail_contacto_con_etiqueta_sin_valor) 

  it 'El MailMerger deberia devolverme el cuerpo del mail para mandarselo a Juan' do

    cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail(data_json, contacto)
    expect(cuerpo_del_mail.include?'Hola Juan').to be_truthy
    expect(cuerpo_del_mail.include?'invitando a la cena de fin de año de la UNTREF').to be_truthy
    expect(cuerpo_del_mail.include?'en el Centro de estudios (avenida Directorio 887, Caseros)').to be_truthy
    expect(cuerpo_del_mail.include?'el día 5 de diciembre').to be_truthy
    expect(cuerpo_del_mail.include?'enviando un mail a fiesta@untref.com').to be_truthy
  end

  it 'El MailMerger deberia devolverme el cuerpo del segundo mail para mandarselo a Matu con el pais reemplazado' do

    cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail(data_json_con_pais, contacto_con_pais)
    expect(cuerpo_del_mail.include?'Hola Matu Amigo').to be_truthy
    expect(cuerpo_del_mail.include?'invitando a la copa del mundo').to be_truthy
    expect(cuerpo_del_mail.include?'en Jamaica').to be_truthy
    expect(cuerpo_del_mail.include?'el día 16 de Junio').to be_truthy
    expect(cuerpo_del_mail.include?'enviando un mail a fifa@fifa.com').to be_truthy
  end

  it 'El MailMerger deberia devolverme el cuerpo del segundo mail para mandarselo a un chaval que evadio impuestos' do
    string_con_hora_actual = 'a las ' + Time.now.strftime('%I:%M%p')
    cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail(data_json_fraude, contacto_con_denuncia)
    expect(cuerpo_del_mail.include?'Hola Chaval').to be_truthy
    expect(cuerpo_del_mail.include?'invitando a pagar').to be_truthy
    expect(cuerpo_del_mail.include?'en Argelia').to be_truthy
    expect(cuerpo_del_mail.include?'el día 5 de diciembre').to be_truthy
    expect(cuerpo_del_mail.include? string_con_hora_actual).to be_truthy    
  end

  it 'El MailMerger deberia devolverme el cuerpo mail con la etiqueta <sum(1,3)> sumada correctamente' do
    cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail(data_json_suma, contacto_con_suma)
    expect(cuerpo_del_mail.include?'Hola Juan').to be_truthy
    expect(cuerpo_del_mail.include?'cuando sumo 1 y 3 obtengo  4').to be_truthy
  end

  it 'Al no pasarle pasarle parametros deberia levantar una excepcion' do
    expect{
      cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail()
    }.to raise_error()
  end

  it 'Al pasarle un template con una etiqueta sin valor deberia levantar una excepcion' do
    expect{
      let(:cuerpo_del_mail) {mailMerger.obtener_cuerpo_del_mail(data_json_etiqueta_sin_valor, contacto_con_etiqueta_sin_valor)}
    }.to raise_error()
  end
end
