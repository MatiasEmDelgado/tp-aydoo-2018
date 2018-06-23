require 'rspec'
require 'rack/test'
require 'json'
require_relative '../model/Template'

describe 'template' do

  parametros = File.read('spec/data1.json')
  parametros = JSON.parse(parametros.to_s)
  parametros = parametros.to_json
  let(:template) { Template.new(parametros) }  
   
   
  it 'Al pedirle los tags al template deberia devolverme un array con los tags, en el json de ejemplo los tags son 5' do
    expect(template.tags.length).to eq 5
  end

  it 'Al pedirle el primer tag al template deberia devolverme nombre' do
    expect(template.tags[0].nombre).to eq 'nombre'
  end

  it 'Al pedirle el segundo tag al template deberia devolverme nombre_evento' do
    expect(template.tags[1].nombre).to eq 'nombre_evento'
  end

  it 'Al pedirle el tercer tag al template deberia devolverme lugar_del_evento' do
    expect(template.tags[2].nombre).to eq 'lugar_del_evento'
  end

  it 'Al pedirle el cuarto tag al template deberia devolverme fecha_del_evento' do
    expect(template.tags[3].nombre).to eq 'fecha_del_evento'
  end

  it 'Al pedirle el quinto tag al template deberia devolverme <mail_de_confirmacion>' do
    expect(template.tags[4].nombre).to eq 'mail_de_confirmacion'
  end

end
