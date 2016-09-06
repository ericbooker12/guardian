class SmsController < ApplicationController

	def text_friend
		@user = current_user
		message = "Thanks for watching that I get home safely. Link to watch: http://localhost:3000/events/#"

	 	to = @user.friends.first
	 	client = Twilio::REST::Client.new(
	    	ENV["TWILIO_ACCOUNT_SID"],
	    	ENV["TWILIO_AUTH_TOKEN"]
	  	)
	  	if client.messages.create(
	    		to: to.phone_number,
	    		from: '+16502156875',
	     		body: message
	    	)
	    	flash[:notice] = "Message has been sent!"
	  	else
	    	flash[:notice] = "Error: Message did not send"
	  	end
	end

	def text_friend_once_home
		@user = current_user
		message = "I'm home! Thanks for walking with me =)"

	 	to = @user.friends.first
	 	client = Twilio::REST::Client.new(
	    	ENV["TWILIO_ACCOUNT_SID"],
	    	ENV["TWILIO_AUTH_TOKEN"]
	  	)
	  	if client.messages.create(
	    		to: to.phone_number,
	    		from: '+16502156875',
	     		body: message
	    	)
	    	flash[:notice] = "Message has been sent!"
	  	else
	    	flash[:notice] = "Error: Message did not send"
	  	end
	end
end
