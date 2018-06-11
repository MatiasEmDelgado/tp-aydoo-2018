require_relative '../model/Tag'

class TagFactory
   def self.get_tag_instance(nombre_del_tag, json)
   	 json = JSON.parse(json)
   	 datos = json['datos']
   	 datos = JSON.parse(datos.to_json)
   	 contactos = json['contactos'].to_json
   	 
     if (nombre_del_tag.include? 'pais')
       valor_tag = datos[nombre_del_tag]
       if(!valor_tag.nil? || !valor_tag.to_s.empty?)
       	 Tag.new(nombre_del_tag, valor_tag)
       else
       	 posicion_coma = nombre_del_tag.index(',')
       	 posicion_parentesis_inicial = nombre_del_tag.index('(')
       	 posicion_parentesis_final = nombre_del_tag.index(')')
      	 clave_del_tag = nombre_del_tag[posicion_parentesis_inicial +1, posicion_coma - posicion_parentesis_inicial -1]
      	 default_del_tag = nombre_del_tag[posicion_coma + 1, posicion_parentesis_final - posicion_coma - 1]
         valor_tag = datos[clave_del_tag]
      	 if(!valor_tag.to_s.empty?)
      	   Tag.new(nombre_del_tag, valor_tag.capitalize)	
      	 else
       	   Tag.new(nombre_del_tag, default_del_tag.capitalize)
       	 end	
       end	
     elsif (nombre_del_tag.include? "date")
     	if(nombre_del_tag.include? "date:d")
     		valor_tag = Date.today.strftime('%d-%m-%Y')
     	elsif 
     		valor_tag = Date.today.strftime('%Y-%m-%d')
     	end
     	Tag.new(nombre_del_tag, valor_tag.capitalize)
     else
       Tag.new(nombre_del_tag, "sarasa")
     end

  end
end