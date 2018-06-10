require_relative "ManejadorEtiquetas"

class ManejadorFecha < ManejadorEtiquetas

  def reemplazar(template, datos)
  	etiqueta = template.scan(/<date:.>/)
  	
    if etiqueta[0].eql? "<date:d>"
  		template.gsub("<date:d>", Date.today.strftime('%d-%m-%Y'))
    elsif etiqueta[0].eql? "<date:i>"
  		template.gsub("<date:i>", Date.today.to_s)    
    end
  end

end