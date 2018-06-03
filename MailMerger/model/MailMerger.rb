class MailMerger

  def reemplazar_nombre(template, nombre_contacto)
    template.gsub(/<nombre>/, nombre_contacto)
  end

  def reemplazar_nombre_evento(template, nombre_evento)
    template.gsub(/<nombre_evento>/, nombre_evento)
  end

end
