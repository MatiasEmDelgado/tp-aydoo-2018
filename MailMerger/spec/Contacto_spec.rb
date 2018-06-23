require 'rspec' 
require_relative '../model/Contacto'

describe 'contacto' do

  let(:contacto) { Contacto.new('Matias', 'Delgado', 'matias.untref@gmail.com') }  
   
  it 'Al pedirle el nombre al contacto deberia devolverme el valor Matias' do
    expect(contacto.nombre).to eq ('Matias')
  end 

  it 'Al pedirle el apellido al contacto deberia devolverme el valor Matias' do
    expect(contacto.apellido).to eq ('Delgado')
  end   
  
  it 'Al pedirle el mail al contacto deberia devolverme el valor Matias' do
    expect(contacto.mail).to eq ('matias.untref@gmail.com')
  end

end
