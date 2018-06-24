require_relative 'Tag'

class TagSuma < Tag
  def initialize (nombre_del_tag, datos)
    nombre_del_tag = nombre_del_tag.gsub(/\s+/, "")
    posicion_coma = nombre_del_tag.index(',')
    posicion_parentesis_inicial = nombre_del_tag.index('(')
    posicion_parentesis_final = nombre_del_tag.index(')')
    valor_uno = nombre_del_tag[posicion_parentesis_inicial +1, posicion_coma - posicion_parentesis_inicial -1]
    valor_dos = nombre_del_tag[posicion_coma + 1, posicion_parentesis_final - posicion_coma - 1]
    if (valor_uno.to_i != 0)
      valor_uno = valor_uno.to_i
    else
      valor_uno = datos[valor_uno].to_i    
    end
    if (valor_dos.to_i != 0)
      valor_dos = valor_dos.to_i
    else
      valor_dos = datos[valor_dos].to_i    
    end
    valor_tag = valor_uno + valor_dos
    super(nombre_del_tag, valor_tag.to_s)
  end	
end