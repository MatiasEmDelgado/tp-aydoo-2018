require_relative '../model/Tag'

class TagSuma < Tag
  def initialize (nombre_del_tag, datos)
    posicion_coma = nombre_del_tag.index(',')
    posicion_parentesis_inicial = nombre_del_tag.index('(')
    posicion_parentesis_final = nombre_del_tag.index(')')
    valor_uno = nombre_del_tag[posicion_parentesis_inicial +1, posicion_coma - posicion_parentesis_inicial -1]
    valor_dos = nombre_del_tag[posicion_coma + 2, posicion_parentesis_final - posicion_coma - 2]
    valor_uno = datos[valor_uno].to_i
	valor_dos = datos[valor_dos].to_i
    valor_tag = valor_uno + valor_dos
    super(nombre_del_tag, valor_tag.to_s)
  end	
end