require 'rspec'
require 'rack/test'
require 'json'
require_relative '../model/Mail'

describe 'mail' do
  parametros = File.read('spec/data1.json')
  parametros = JSON.parse(parametros.to_s)
  parametros = parametros.to_json
  let(:mail) { EMail.new(parametros) }  
   
  it 'Al pedirle el origen al mail deberia devolverme el valor universidad@untref.com' do
    expect(mail.origen).to eq ('universidad@untref.com')
  end 

  it 'Al pedirle el asunto al mail deberia devolverme el valor Invitación a fiesta de fin de año' do
    expect(mail.asunto).to eq ('Invitación a fiesta de fin de año')
  end

  it 'Al pedirle los contactos al mail deberia devolverme un array con dos valores' do
    expect(mail.contactos.length ).to eq 2
  end

  it 'Al pedirle el primer contacto al mail deberia devolverme a Juan' do
    expect(mail.contactos[0].nombre ).to eq "Juan"
  end

  it 'Al pedirle el segundo contacto al mail deberia devolverme a Maria' do
    expect(mail.contactos[1].nombre ).to eq "Maria"
  end

end
