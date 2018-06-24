class Contacto

  attr_accessor :nombre, :apellido, :mail

  def initialize(nombre, apellido, mail)
  	if(mail.include? '@')
	    @nombre = nombre
	    @apellido = apellido
	    @mail = mail
	else
      error = ContactoException.new('El mail del Contacto ' + nombre + ' ' + apellido + ' tiene un formato incorrecto')
      puts error.message
      raise error
    end
  end
  
end

class ContactoException < StandardError
  def initialize(msg)
    super(msg)
  end
end
