require_relative '../model/Template'
require 'json'

class MailMerger

  def obtener_cuerpo_del_mail(json, nombre_contacto)
    template = Template.new(json.to_json)
    reemplazar_nombre(template, nombre_contacto)
  
    template.tags.each do |tag|
      if(tag.nombre != "nombre")
        reemplazar_tag(tag, template)
      end
    end

    template.cuerpo
  end
  
  def reemplazar_tag(tag, template)
    template.cuerpo = template.cuerpo.gsub(tag.clave, tag.valor)
  end

  def reemplazar_nombre(template, nombre_contacto)
    template.cuerpo = template.cuerpo.gsub(/<nombre>/, nombre_contacto.capitalize)
  end

end
