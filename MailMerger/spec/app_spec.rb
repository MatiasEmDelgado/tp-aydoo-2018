require_relative '../app'
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
  parametros = File.read('./json_de_ejemplos/data1.json')
  parametros = JSON.parse(parametros.to_s)
  parametros = parametros.to_json

  parametros_invalidos = File.read('./json_de_ejemplos/data2_esquema_incorrecto.json')
  parametros_invalidos = JSON.parse(parametros_invalidos.to_s)
  parametros_invalidos = parametros_invalidos.to_json

  describe '/enviarMail' do
    it 'Deberia simular el envio de un mail' do
      MailSender.any_instance.stub(:enviar_mail)
      post '/enviarMail', parametros, h
      cuerpo_parseado = JSON.parse(last_response.body)
      expect(last_response).to be_ok
      expect(cuerpo_parseado['resultado']).to eq 'ok'
    end
  end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
  
  it 'Deberia simular el envio de un mail con formato invalido' do
    MailSender.any_instance.stub(:enviar_mail)
    post '/enviarMail', parametros_invalidos, h
    cuerpo_parseado = JSON.parse(last_response.body)
    expect(last_response).not_to be_ok
    expect(cuerpo_parseado['resultado']).to eq 'entrada incorrecta'
  end
end
