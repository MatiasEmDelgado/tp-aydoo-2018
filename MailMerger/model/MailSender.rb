require 'mail'

class MailSender

  def enviar_mail(mail)
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end
    
    Mail.deliver do
      from     mail.origen
      to       mail.contacto.mail
      subject  mail.asunto
      body     mail.cuerpo
    end
  end
end

