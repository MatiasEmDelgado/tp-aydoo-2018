require_relative 'Tag'

class TagDate < Tag  
  def initialize (nombre_del_tag)
    if(nombre_del_tag.include? "date:d")
      valor_tag = Date.today.strftime('%d-%m-%Y')
    else
      valor_tag = Date.today.strftime('%Y-%m-%d')
    end
    super(nombre_del_tag, valor_tag.capitalize)
  end	
end