require 'rspec' 
require_relative '../model/MailSender'
require_relative '../model/MailMerger'
require 'rack/test'
require 'json'

describe 'MailSender' do

  let(:mailSender) { MailSender.new }

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
       "remitente": "universidad@untref.com",
       "asunto":"Invitación a fiesta de fin de año",
       "nombre_evento":"la cena de fin de año de la UNTREF",
       "lugar_evento":"el Centro de estudios (avenida Directorio 887, Caseros)",
       "fecha_del_evento":"5 de diciembre",
       "Mail_de_confirmacion":"fiesta@untref.com"
    }
 }


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
