class Contacto

  attr_accessor :nombre, :apellido, :mail

  def initialize(nombre, apellido, mail)
    begin
      raise 'El mail del Contacto ' + nombre + ' ' + apellido + ' tiene un formato incorrecto' unless mail.include? '@'
	    
      @nombre = nombre
	    @apellido = apellido
	    @mail = mail
      
    rescue Exception => e
      puts e.message
    end
  end
  
end
