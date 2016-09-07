class EventsController < ApplicationController
	# before_action :all_tasks, only: [:index, :create]
	# respond_to :html, :js

	def index
		@events = current_user.events
		render :layout => false
	end

	def create
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

			if request.xhr?

				@event.to_json
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
		p "in the edit route"
		p "*" * 50
		edit_event_path
	end

	def show
		@user = User.find(params[:id])
		@event = Event.find(1)
		event_path

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
