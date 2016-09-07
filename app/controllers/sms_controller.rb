class SmsController < ApplicationController

	def text_friend
		@user = current_user
		message = "This is " + current_user.first_name + " " + current_user.last_name + "Thanks for watching that I get home safely! Link to watch: http://localhost:3000/events/#"

	 	to = @user.friends.first
	 	client = Twilio::REST::Client.new(
	    	ENV["TWILIO_ACCOUNT_SID"],
	    	ENV["TWILIO_AUTH_TOKEN"]
	  	)
	  	if client.messages.create(

	    		to: to.phone_number,
	    		from: current_user.phone_number,
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
	    		from: current_user.phone_number,
	     		body: message
	    	)
	    	flash[:notice] = "Text message to your friend has been sent!"
				@events = @user.events
	  	else
	    	flash[:notice] = "Error: Message did not send"
	  	end
	end
end

