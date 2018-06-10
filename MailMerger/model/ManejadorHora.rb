require_relative "ManejadorEtiquetas"

class ManejadorHora < ManejadorEtiquetas

  def reemplazar(template, datos)
  	etiqueta = template.scan(/<time.*>/)

  	if etiqueta[0].eql? "<time>"
  		template.gsub("<time>", Time.now.strftime('%H:%M'))
  	elsif etiqueta[0].eql? "<time:12>"
  		template.gsub("<time:12>", Time.now.strftime('%l:%M%p'))
  	end

  end

end