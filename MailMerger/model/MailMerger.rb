class MailMerger

  def obtener_cuerpo_del_mail(json, nombre_contacto)
    template = json['template']
    nombre_evento = json['datos']['nombre_evento']
    lugar_evento = json['datos']['lugar_evento']
    fecha_evento = json['datos']['fecha_del_evento']
    mail_de_confirmacion = json['datos']['Mail_de_confirmacion']
    template = reemplazar_nombre(template, nombre_contacto.capitalize)
    template = reemplazar_nombre_evento(template, nombre_evento)
    template = reemplazar_lugar_evento(template, lugar_evento)
    template = reemplazar_fecha_evento(template, fecha_evento)
    template = reemplazar_mail_de_confirmacion(template, mail_de_confirmacion)
  end
  	
  def reemplazar_nombre(template, nombre_contacto)
    template.gsub(/<nombre>/, nombre_contacto)
  end

  def reemplazar_nombre_evento(template, nombre_evento)
    template.gsub(/<nombre_evento>/, nombre_evento)
  end
  
  def reemplazar_lugar_evento(template, lugar_del_evento)
  	template.gsub(/<lugar_del_evento>/, lugar_del_evento)
  end

  def reemplazar_fecha_evento(template, fecha_del_evento)
    template.gsub(/<fecha_del_evento>/, fecha_del_evento)
  end	
  
  def reemplazar_mail_de_confirmacion(template, mail_de_confirmacion)
    template.gsub(/<mail_de_confirmacion>/, mail_de_confirmacion)
  end
end
