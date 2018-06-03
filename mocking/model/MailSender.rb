require 'mail'


class MailSender

	options = { :address              => "localhost",
	            :port                 => 1025,
	            :domain               => 'localhost',
	            :user_name            => 'your username',
	            :password             => 'your password',
	            :authentication       => 'plain',
	            :enable_starttls_auto => true  }



	Mail.defaults do
	  delivery_method :smtp, options
	end

	Mail.deliver do
	       to 'their@email.com'
	     from 'your@email.com'
	  subject 'test email'
	     body 'This is a test.'
	end
end