require_relative '../model/Template'
require 'json'

class MailMerger

  def obtener_cuerpo_del_mail(json, nombre_contacto)
    template = Template.new(json.to_json)
    reemplazar_nombre(template, nombre_contacto)
  
    template.tags.each do |tag|
      reemplazar_tag(json['datos'], tag.nombre, template)
    end

    template.cuerpo
  end
  	
  def reemplazar_tag(datos, nombre_tag, template)
  	valor_tag = datos[nombre_tag]
  	unless (valor_tag == nil)
  	  tag = '<' + nombre_tag + '>'
      template.cuerpo = template.cuerpo.gsub(tag, valor_tag)
    end
  end

  def reemplazar_nombre(template, nombre_contacto)
    template.cuerpo = template.cuerpo.gsub(/<nombre>/, nombre_contacto.capitalize)
  end

end
