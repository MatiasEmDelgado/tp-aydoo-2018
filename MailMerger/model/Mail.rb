require_relative './Contacto'
require 'json'

class Mail_
  
  attr_accessor :origen, :asunto, :contacto, :cuerpo

  def initialize(origen, asunto, contacto, cuerpo)
    @origen = origen
    @asunto = asunto
    @contacto = contacto
    @cuerpo = cuerpo
    
    #contactos_en_el_json = json['contactos']
    
    #contactos_en_el_json.each do |contacto|
     # nombre_contacto = JSON.parse(contacto.to_json)['nombre']
      #apellido_contacto = JSON.parse(contacto.to_json)['apellido']
      #mail = JSON.parse(contacto.to_json)['mail']
      #@contactos << Contacto.new(nombre_contacto.capitalize, apellido_contacto.capitalize, mail)
    #end
  end

end
