require_relative 'Contacto'
require 'json'

class Mail_
  
  attr_accessor :origen, :asunto, :contacto, :cuerpo

  def initialize(origen, asunto, contacto, cuerpo)
    @origen = origen
    @asunto = asunto
    @contacto = contacto
    @cuerpo = cuerpo
  end

end