require_relative '../model/Tag'

class TagFactory
   def self.get_tag_instance(nombre_del_tag, json)
   	 json = JSON.parse(json)
   	 datos = json['datos']
   	 datos = JSON.parse(datos.to_json)
   	 contactos = json['contactos'].to_json
   	 #contactos == contactos.to_s
      
   	 
  	 #case nombre
     if (nombre_del_tag.include? 'pais')
     	puts "111111111111"
       valor_tag = datos[nombre_del_tag]
       if(!valor_tag.nil? || !valor_tag.to_s.empty?)
       	puts "2222222222222"
         Tag.new(nombre_del_tag, valor_tag)
       else
       	puts "3333333333333333"
       	 posicion_coma = nombre_del_tag.index(',')
       	 posicion_parentesis_inicial = nombre_del_tag.index('(')
       	 posicion_parentesis_final = nombre_del_tag.index(')')
      	 clave_del_tag = nombre_del_tag[posicion_parentesis_inicial +1, posicion_coma - posicion_parentesis_inicial -1]
      	 default_del_tag = nombre_del_tag[posicion_coma + 1, posicion_parentesis_final - posicion_coma - 1]
         valor_tag = datos[clave_del_tag]
      	puts valor_tag.to_s.empty?
      	 puts "------"
      	 if(!valor_tag.to_s.empty?)
      	 	puts "444444444444444"
      	   Tag.new(nombre_del_tag, datos[clave_del_tag])	
      	 else
      	 	puts "555555"
       	   Tag.new(nombre_del_tag, default_del_tag.capitalize)
       	 end	
       end	
     else
     	puts "666666666"

       Tag.new(nombre_del_tag, "sarasa")
     end

  end
end