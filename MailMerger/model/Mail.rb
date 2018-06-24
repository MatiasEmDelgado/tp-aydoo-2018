require_relative 'Contacto'
require 'json'

class Mail_
  
  attr_accessor :origen, :asunto, :contacto, :cuerpo

  def initialize(origen, asunto, contacto, cuerpo)
  	if(origen.include? '@')
	    @origen = origen
	    @asunto = asunto
	    @contacto = contacto
	    @cuerpo = cuerpo
    else
      error = MailException.new('El mail del remitente tiene un formato incorrecto')
      puts error.message
      raise error
    end
  end

end

class MailException < StandardError
  def initialize(msg)
    super(msg)
  end
end