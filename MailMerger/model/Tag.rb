class Tag
  attr_accessor :nombre, :clave, :valor

  def initialize(nombre, valor)
    @nombre = nombre
    @clave = '<' + nombre + '>'
    @valor = valor
  end
end