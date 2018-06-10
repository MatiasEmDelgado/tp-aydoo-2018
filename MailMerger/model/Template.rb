class Template
  
  attr_accessor :tags

  def initialize(json)
    json = JSON.parse(json)
    @tags = []
    palabras_en_el_template = json.to_s.split(' ')
     
    palabras_en_el_template.each do |palabra|
    	if(palabra.include? '<')
    	  nombre_del_tag = palabra[1, palabra.index('>')-1] 
          @tags << Tag.new(nombre_del_tag)
        end
    end  
  end

end