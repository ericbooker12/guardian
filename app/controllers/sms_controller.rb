class SmsController < ApplicationController

	def text_friend
		@user = current_user
		p @user

		message = "Help, I'm being followed by a drone!"


	 	to = @user.friends.first
	 	client = Twilio::REST::Client.new(
	    	ENV["TWILIO_ACCOUNT_SID"],
	    	ENV["TWILIO_AUTH_TOKEN"]
	  	)

	  	if client.messages.create(
	    		to: to.phone_number,
	    		from: @user.phone_number,
	     		body: message
	    	)

	    	flash[:notice] = "Message has been sent!"
	  	else
	    	flash[:notice] = "Error: Message did not send"
	  	end
	  	
	  	redirect '/dashboard'
	end
 
end