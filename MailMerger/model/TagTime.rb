require_relative 'Tag'

class TagTime < Tag  
  def initialize (nombre_del_tag)
    if(nombre_del_tag.include? "time:12")
      valor_tag = Time.now.strftime('%I:%M%p')
    else
      valor_tag = Time.now.strftime('%H:%M')
    end
    super(nombre_del_tag, valor_tag)
  end
end