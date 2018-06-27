require_relative 'Tag'
require_relative 'TagPais'
require_relative 'TagSuma'
require_relative 'TagDate'
require_relative 'TagTime'

class TagFactory
   def self.get_tag_instance(nombre_del_tag, json)
   	 json = JSON.parse(json)
   	 datos = json['datos']
   	 datos = JSON.parse(datos.to_json)
   	 contactos = json['contactos']
   	 contactos = JSON.parse(contactos.to_json)
     if (nombre_del_tag.include? 'pais')
       TagPais.new(nombre_del_tag, datos) 
     elsif (nombre_del_tag.include? "date")
       TagDate.new(nombre_del_tag)
     elsif (nombre_del_tag.include? 'sum')
     	TagSuma.new(nombre_del_tag, datos)
     elsif (nombre_del_tag.include? 'time')
       TagTime.new(nombre_del_tag)
     elsif ((nombre_del_tag.include? '<nombre>') || (nombre_del_tag.include? '<apellido>'))
        valor_tag = "nombre"
      	Tag.new(nombre_del_tag, valor_tag)   			
     else
        valor_tag = datos[nombre_del_tag]
        Tag.new(nombre_del_tag, valor_tag)
     end
  end
end