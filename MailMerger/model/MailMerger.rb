require_relative 'Template'
require 'json'

class TagException < StandardError
  def initialize(msg)
    super(msg)
  end
end

class MailMerger

  def obtener_cuerpo_del_mail(json, contacto)
    template = Template.new(json.to_json)
    reemplazar_nombre(template, contacto.nombre)
    reemplazar_apellido(template, contacto.apellido)
    template.tags.each do |tag|
      if(tag.nombre != 'nombre' && tag.nombre != 'apellido')
          reemplazar_tag(tag, template)
      end
    end

    template.cuerpo
  end
  
  def reemplazar_tag(tag, template)
    if (tag.valor != nil)
      template.cuerpo = template.cuerpo.gsub(tag.clave, tag.valor)
    else
      error = TagException.new('Usted no tiene un valor definido en su json para la etiqueta ' + tag.nombre)
      puts error.message
      raise error
    end
  end

  def reemplazar_nombre(template, nombre_contacto)
    template.cuerpo = template.cuerpo.gsub(/<nombre>/, nombre_contacto.capitalize)
  end

  def reemplazar_apellido(template, apellido_contacto)
    template.cuerpo = template.cuerpo.gsub(/<apellido>/, apellido_contacto.capitalize)
  end

end