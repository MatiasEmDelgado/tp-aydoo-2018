require_relative 'Contacto'
require 'json'

class Mail_
  
  attr_accessor :origen, :asunto, :contacto, :cuerpo

  def initialize(origen, asunto, contacto, cuerpo)
    begin
      raise 'El mail del remitente tiene un formato incorrecto' unless origen.include? '@'

	    @origen = origen
	    @asunto = asunto
	    @contacto = contacto
	    @cuerpo = cuerpo
      
    rescue Exception => e
      puts e.message
    end
  end

end