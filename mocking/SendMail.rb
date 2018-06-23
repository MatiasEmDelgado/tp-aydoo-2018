require 'sinatra'
require 'sinatra/json'

post '/' do


	
	return response.status, json({"resultado": "ok"})
end

error 500 do
	return response.status, json({"resultado": "error, entrada incorrecta"})
end