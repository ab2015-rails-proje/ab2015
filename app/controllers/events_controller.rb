class EventsController < ApplicationController
	def show
		@event = Event.find(params[:id])
		@lessons = @event.lesson
  end

  def index
    @events = Event.all
    @events.order(id: :desc)
  end

end
