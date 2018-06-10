require 'rspec' 
require_relative '../model/Tag'

describe 'tag' do

  let(:tag) { Tag.new('nombre') }  
   
  it 'Al pedirle el nombre al tag nombre deberia devolverme el valor nombre' do
    expect(tag.nombre).to eq ('nombre')
  end 

end