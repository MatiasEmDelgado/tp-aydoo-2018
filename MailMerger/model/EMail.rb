require_relative './Contacto'
require 'json'

class EMail
  
  attr_accessor :origen, :asunto, :contactos

  def initialize(json)
    json = JSON.parse(json)
    @origen = json['datos']['remitente']
    @asunto = json['datos']['asunto']
    @contactos = []
    
    contactos_en_el_json = json['contactos']
    
    contactos_en_el_json.each do |contacto|
      nombre_contacto = JSON.parse(contacto.to_json)['nombre']
      apellido_contacto = JSON.parse(contacto.to_json)['apellido']
      mail = JSON.parse(contacto.to_json)['mail']
      @contactos << Contacto.new(nombre_contacto.capitalize, apellido_contacto.capitalize, mail)
    end
  end

end
