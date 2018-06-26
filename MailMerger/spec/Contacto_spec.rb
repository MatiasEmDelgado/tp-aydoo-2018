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

  it 'Al no pasarle parametros al contacto deberia levantar una excepcion' do
    expect{
      let(:contactoInvalido) { Contacto.new() }
    }.to raise_error()
  end

  it 'Al pasarle como mail de contacto un mail invalido deberia levantar una excepcion' do
    expect{
      let(:contactoInvalido) { Contacto.new('Matias', 'Delgado', 'mail invalido') }
    }.to raise_error()
  end

end
