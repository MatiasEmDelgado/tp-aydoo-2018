require 'rspec'
require 'rack/test'
require 'json'
require_relative '../model/TagFactory'
require_relative '../model/Tag'

describe 'tag_factory' do

  parametros = File.read('./json_de_ejemplos/etiquetas_especiales.json')
  parametros = JSON.parse(parametros.to_s)
  parametros = parametros.to_json

  parametros_con_pais = File.read('./json_de_ejemplos/etiquetas_especiales_con_pais.json')
  parametros_con_pais = JSON.parse(parametros_con_pais.to_s)
  parametros_con_pais = parametros_con_pais.to_json

  parametros_con_date = File.read('./json_de_ejemplos/etiquetas_especiales_con_date.json')
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
    expect(tag.valor).to eq Date.today.strftime('%Y-%m-%d')
  end

  it 'Al pedirle crear un tags date:d al factory deberia devolverme un tag con el valor correspondiente' do
    tag = TagFactory.get_tag_instance('<date:d>', parametros_con_date)
    expect(tag.valor).to eq Date.today.strftime('%d-%m-%Y')
  end

  it 'Al pedirle crear un tags <sum(monto1, monto2)> al factory deberia devolverme un tag con el valor de la suma' do
    tag = TagFactory.get_tag_instance('<sum(monto1, monto2)>', parametros)
    expect(tag.valor).to eq '900'
  end
  
it 'Al pedirle crear un tags <sum(4, 6)> al factory deberia devolverme un tag con el valor de la suma 4 + 6 = 10' do
    tag = TagFactory.get_tag_instance('<sum(4, 6)>', parametros)
    expect(tag.valor).to eq '10'
  end

  it 'Al pedirle crear un tags <time:12> al factory deberia devolverme un tag con el valor de la hora actual en formato 12 horas' do
    tag = TagFactory.get_tag_instance('<time:12>', parametros)
    expect(tag.valor).to eq Time.now.strftime('%I:%M%p')
  end

  it 'Al pedirle crear un tags <time:12> al factory deberia devolverme un tag con el valor de la hora actual en formato 24 hs' do
    tag = TagFactory.get_tag_instance('<time>', parametros)
    expect(tag.valor).to eq Time.now.strftime('%H:%M')
  end

end