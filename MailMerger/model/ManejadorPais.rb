require_relative "ManejadorEtiquetas"

class ManejadorPais < ManejadorEtiquetas

  def reemplazar(template, datos)
    pais = "argentina"

    if datos["pais"]
    	pais = datos["pais"]
    end

    template.gsub('<empty(pais, argentina)>', pais)
  end

end