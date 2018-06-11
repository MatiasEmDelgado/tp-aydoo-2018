require_relative '../model/Tag'
require_relative '../model/TagFactory'

class Template
  
  attr_accessor :tags, :cuerpo

  def initialize(json)
    json = JSON.parse(json)
    datos = json['datos'].to_s
    @cuerpo = json['template'].to_s
    @tags = []
    palabras_en_el_template = json.to_s.split(' ')
     
    palabras_en_el_template.each do |palabra|
    	if(palabra.include? '<')
    	  nombre_del_tag = palabra[1, palabra.index('>')-1]
        @tags << Tag.new(nombre_del_tag, "hola")
      end
    end  
  end

end