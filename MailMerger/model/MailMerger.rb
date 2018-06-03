class MailMerger

  def reemplazar_nombre(template, nombre_contacto)
    template.gsub(/<nombre>/, nombre_contacto)
  end

  def reemplazar_nombre_evento(template, nombre_evento)
    template.gsub(/<nombre_evento>/, nombre_evento)
  end
  
  def reemplazar_lugar_evento(template, lugar_evento)
  	template.gsub(/<lugar_del_evento>/, lugar_evento)
  end
end
