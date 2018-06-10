require 'mail'

class MailSender

  def enviar_mail(origen, destino, asunto, cuerpo)
    Mail.defaults do
      delivery_method :smtp, address: "localhost", port: 1025
    end
    
    Mail.deliver do
      from     origen
      to       destino
      subject  asunto
      body     cuerpo
    end
  end
end

