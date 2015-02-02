class EventsController < ApplicationController
	def show
		@event = Event.find(params[:id])
		@lessons = @event.lesson
	end
end
