class EventsController < ApplicationController


	def index
		@events = current_user.events
	end

	def create
		p "in the create route"
		p "*" * 50
		@event = Event.new(user_id: current_user.id, drone_id: 1)

		# To include drone_id in event
		# if current_user.drones.length == 1
			# drone = Drone.find_by user_id: current_user.id
		# 	@event.drone_id = drone.id
		# elsif current_user.drones.length > 1
		# 	Drone.where(user_id: current_user.id)
		# 	# alert message -- which one?
		# else
		# 	error_message = "Set up a guardian to follow you home"
		# end


		if @event.save
			# get location data from phone (add to event table)
			# send text message to friend which includes link for friend to watch livestream/video and location data

			# We'll get back a url to include text msg

		# on successful event initialization,
			if request.xhr?
				# json ping back to change view

				# magical method to make drone start
				'http://172.168.1.1/start'


				# Does assigning of video address happen here or is it, more likely, updated later?
				# trigger drone ToDo auto ToDo list
				data.to_json
			else
			end
		else
			@error_messages = @event.errors.full_messages
			p @error_messages
			root_path
		end
		#
	end

	def edit
		p "in the create route"
		p "*" * 50
		edit_event_path
	end

	def update
		# assign:
			# event.permanent_url
		# delete:   ????
			# event.temp_url
		# update:
			# event.completed = true

		# submits text message to friend indicating home safely
		redirect_to 'events_path'
	end

	def destroy
		# does user need to be able to destroy event from the events index?
	end

end
