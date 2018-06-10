require_relative "ManejadorEtiquetas"

class ManejadorSuma < ManejadorEtiquetas

  def procesar(template, datos)

  	numeros = template.scan(/\d+/).map(&:to_i)
	total = 0
	numeros.each do |numero|
		total += numero
	end

  	template = template.gsub(/<sum.*?>/, total.to_s)
  end

end