require 'rspec' 
require_relative '../model/MailMerger'
require 'rack/test'
require 'json'

describe 'MailMerger' do

  let(:mailMerger) { MailMerger.new }

  data = {
      "template":"Hola <nombre>,\n\r Por medio del presente mail te estamos invitando a <nombre_evento>, que se desarrollará en <lugar_del_evento>, el día <fecha_del_evento>. Por favor confirmar su participación enviando un mail a <mail_de_confirmacion>.\n\rSin otro particular.La direccion",
      "contactos":[
         {
            "nombre":"juan",
            "apellido":"perez",
            "mail":"juanperez@test.com"
         },
         {
            "nombre":"maria",
            "apellido":"gonzalez",
            "mail":"mariagonzalez@test.com"
         }
      ],
      "datos":{
         "asunto":"Invitación a fiesta de fin de año",
         "nombre_evento":"la cena de fin de año de la UNTREF",
         "lugar_evento":"el Centro de estudios (avenida Directorio 887, Caseros)",
         "fecha_del_evento":"5 de diciembre",
         "Mail_de_confirmacion":"fiesta@untref.com"
      }
    }

  data_json = JSON.parse(data.to_json)
  template = data_json['template']
  nombre_contacto = data_json['contactos'][0]['nombre']
  nombre_evento = data_json['datos']['nombre_evento']
  lugar_evento = data_json['datos']['lugar_evento']
  fecha_evento = data_json['datos']['fecha_del_evento']
  mail_de_confirmacion = data_json['datos']['Mail_de_confirmacion']

  it 'El MailMerger deberia devolverme el cuerpo del mail con el nombre reemplazado' do
    cuerpo_del_mail = mailMerger.reemplazar_nombre(template, nombre_contacto)
    expect(cuerpo_del_mail.include?'Hola juan').to be_truthy
  end

  it 'El MailMerger deberia devolverme el cuerpo del mail con el nombre del evento reemplazado' do
    cuerpo_del_mail = mailMerger.reemplazar_nombre_evento(template, nombre_evento)
    expect(cuerpo_del_mail.include?'invitando a la cena de fin de año de la UNTREF').to be_truthy
  end

  it 'El MailMerger deberia devolverme el cuerpo del mail con el lugar del evento reemplazado' do
    cuerpo_del_mail = mailMerger.reemplazar_lugar_evento(template, lugar_evento)
    expect(cuerpo_del_mail.include?'en el Centro de estudios (avenida Directorio 887, Caseros)').to be_truthy
  end
  
  it 'El MailMerger deberia devolverme el cuerpo del mail con la fecha del evento reemplazado' do
    cuerpo_del_mail = mailMerger.reemplazar_fecha_evento(template, fecha_evento)
    expect(cuerpo_del_mail.include?'el día 5 de diciembre').to be_truthy
  end

  it 'El MailMerger deberia devolverme el cuerpo del mail con el mail de confirmacion reemplazado' do
    cuerpo_del_mail = mailMerger.reemplazar_mail_de_confirmacion(template, mail_de_confirmacion)
    expect(cuerpo_del_mail.include?'enviando un mail a fiesta@untref.com').to be_truthy
  end

  it 'El MailMerger deberia devolverme el cuerpo del mail para mandarselo a Juan' do
    cuerpo_del_mail = mailMerger.obtener_cuerpo_del_mail(data_json, nombre_contacto)
    expect(cuerpo_del_mail.include?'Hola Juan').to be_truthy
    expect(cuerpo_del_mail.include?'invitando a la cena de fin de año de la UNTREF').to be_truthy
    expect(cuerpo_del_mail.include?'en el Centro de estudios (avenida Directorio 887, Caseros)').to be_truthy
    expect(cuerpo_del_mail.include?'el día 5 de diciembre').to be_truthy
    expect(cuerpo_del_mail.include?'enviando un mail a fiesta@untref.com').to be_truthy
  end 

end
 