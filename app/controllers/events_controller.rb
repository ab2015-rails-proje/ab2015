class EventsController < ApplicationController
	def show
		@event = Event.find(params[:id])
		@lessons = @event.lessons
  end

  def index
    @events = Event.all
    @events.order(id: :desc)
  end

end
