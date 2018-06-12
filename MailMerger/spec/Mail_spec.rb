require 'rspec'
require 'rack/test'
require 'json'
require_relative '../model/Mail'

describe 'mail' do

  parametros = File.read('spec/data1.json')
  parametros = JSON.parse(parametros.to_s)
  parametros = JSON.parse(parametros.to_json)

  origen = parametros['datos']['remitente']
  asunto = parametros['datos']['asunto']

  nombre_contacto = parametros['contactos'][0]['nombre']
  apellido_contacto = parametros['contactos'][0]['apellido']
  direccion_mail = parametros['contactos'][0]['mail']
  contacto = Contacto.new(nombre_contacto.capitalize, apellido_contacto.capitalize, direccion_mail)

  cuerpo = MailMerger.new.obtener_cuerpo_del_mail(parametros, contacto)

  let(:mail) { Mail_.new(origen, asunto, contacto, cuerpo) }  
   
  it 'Al pedirle el origen al mail deberia devolverme el valor universidad@untref.com' do
    expect(mail.origen).to eq ('universidad@untref.com')
  end 

  it 'Al pedirle el asunto al mail deberia devolverme el valor Invitación a fiesta de fin de año' do
    expect(mail.asunto).to eq ('Invitación a fiesta de fin de año')
  end

  it 'Al pedirle el contacto al mail deberia devolverme un contacto llamado Juan' do
    expect(mail.contacto.nombre ).to eq 'Juan'
  end

  it 'Al pedirle el cuerpo del mail al mail deberia contener el texto Hola Juan' do
    expect(mail.cuerpo.include? "Hola Juan").to be_truthy
  end

end
