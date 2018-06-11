require 'rspec'
require 'rack/test'
require 'json'
require_relative '../model/TagFactory'
require_relative '../model/Tag'

describe 'tag_factory' do

  parametros = File.read('spec/etiquetas_especiales.json')
  parametros = JSON.parse(parametros.to_s)
  parametros = parametros.to_json

  parametros_con_pais = File.read('spec/etiquetas_especiales_con_pais.json')
  parametros_con_pais = JSON.parse(parametros_con_pais.to_s)
  parametros_con_pais = parametros_con_pais.to_json

  parametros_con_date = File.read('spec/etiquetas_especiales_con_date.json')
  parametros_con_date = JSON.parse(parametros_con_date.to_s)
  parametros_con_date = parametros_con_date.to_json
   
  it 'Al pedirle crear un tags pais al factory deberia devolverme un tag con el valor correspondiente a el default' do
    tag = TagFactory.get_tag_instance('<empty(pais,argentina)>', parametros)
    expect(tag.valor).to eq 'Argentina'
  end

  it 'Al pedirle crear un tags pais al factory deberia devolverme un tag con el valor correspondiente que encuentra en los datos del json' do
    tag = TagFactory.get_tag_instance('<empty(pais,argentina)>', parametros_con_pais)
    expect(tag.valor).to eq 'Uruguay'
  end

  it 'Al pedirle crear un tags date:i al factory deberia devolverme un tag con el valor correspondiente' do
    tag = TagFactory.get_tag_instance('<date:i>', parametros_con_date)
    expect(tag.valor).to eq '2018-06-11'
  end

  it 'Al pedirle crear un tags date:d al factory deberia devolverme un tag con el valor correspondiente' do
    tag = TagFactory.get_tag_instance('<date:d>', parametros_con_date)
    expect(tag.valor).to eq '11-06-2018'
  end

  it 'Al pedirle crear un tags <sum(monto1, monto2)> al factory deberia devolverme un tag con el valor de la suma' do
    tag = TagFactory.get_tag_instance('<sum(monto1, monto2)>', parametros)
    expect(tag.valor).to eq '900'
  end

  

end