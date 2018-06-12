require_relative '../model/Tag'

class TagPais < Tag  
  def initialize (nombre_del_tag, datos)
    valor_tag = datos[nombre_del_tag]
    if(!valor_tag.nil? || !valor_tag.to_s.empty?)
       super(nombre_del_tag, valor_tag)
       else
       	 posicion_coma = nombre_del_tag.index(',')
       	 posicion_parentesis_inicial = nombre_del_tag.index('(')
       	 posicion_parentesis_final = nombre_del_tag.index(')')
      	 clave_del_tag = nombre_del_tag[posicion_parentesis_inicial +1, posicion_coma - posicion_parentesis_inicial -1]
      	 default_del_tag = nombre_del_tag[posicion_coma + 1, posicion_parentesis_final - posicion_coma - 1]
         valor_tag = datos[clave_del_tag]
      	 if(!valor_tag.to_s.empty?)
      	   super(nombre_del_tag, valor_tag.capitalize)	
      	 else
       	   super(nombre_del_tag, default_del_tag.capitalize)
       	 end	
       end
  end
end