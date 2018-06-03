require 'rspec' 

describe 'MailSender' do
   
  it 'al usar el mock de mailsender debe devolver true sin mandar el mail' do
    mailSender = double

    mailSender.should_receive(:deliver).and_return(true)

    expect(mailSender.deliver).to be_truthy
  end
end