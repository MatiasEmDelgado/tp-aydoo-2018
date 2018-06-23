require 'rspec' 

describe 'mock' do

  subject { mock.new }  
   
  it 'probando usar el mock' do
    mock = double

    mock.should_receive(:getSecuenciaInvertida).with(5).and_return([3,2,1,1,0])

    expect(mock.getSecuenciaInvertida(5)).to match_array([3,2,1,1,0])
  end
end