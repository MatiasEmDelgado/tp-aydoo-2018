require 'rspec' 
require_relative '../model/Tag'

describe 'tag' do

  let(:tag) { Tag.new('nombre', 'valor') }  
   
  it 'Al pedirle el nombre al tag nombre deberia devolverme el valor nombre' do
    expect(tag.nombre).to eq ('nombre')
  end 

  it 'Al pedirle el valor al tag nombre deberia devolverme su valor' do
    expect(tag.valor).to eq ('valor')
  end 

end