class MailMerger

  def reemplazar_nombre(template, nombre_contacto)
    template.gsub(/<nombre>/, nombre_contacto)
  end

end
