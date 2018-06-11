require 'rspec'
require 'rack/test'
require 'json'
require_relative '../model/TagFactory'
require_relative '../model/Tag'

describe 'tag_factory' do

  parametros = File.read('spec/etiquetas_especiales.json')
  parametros = JSON.parse(parametros.to_s)
  parametros = parametros.to_json
   
  it 'Al pedirle crear un tags pais al factory deberia devolverme un tag con el valor correspondiente' do
    tag = TagFactory.get_tag_instance('<empty(pais,argentina)>', parametros)
    expect(tag.valor).to eq 'Argentina'
  end

end