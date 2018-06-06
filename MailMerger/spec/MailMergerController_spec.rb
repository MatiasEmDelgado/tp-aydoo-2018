require_relative '../controller/MailMergerController'
require 'rspec'
require 'rack/test'
require 'json'
require 'sinatra'
require 'sinatra/json'

describe 'Aplicacion Sinatra' do

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  h = {'Content-Type' => 'application/json'}
  parametros = File.read('spec/data1.json')
  parametros = JSON.parse(parametros.to_s)
  parametros = parametros.to_json
  describe '/mail' do
    it 'Deberia sarasa' do
      post '/mail', parametros, h
      cuerpo_parseado = JSON.parse(last_response.body)
      expect(last_response).to be_ok
      expect(cuerpo_parseado['resultado']).to eq 'ok'

    end
  end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

end                         