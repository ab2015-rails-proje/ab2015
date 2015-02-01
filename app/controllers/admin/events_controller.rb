class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @events = Event.all
    respond_with(:admin, @events)
  end

  def show
    respond_with(:admin, @event)
  end

  def new
    @event = Event.new(name: 'TEstsetestes')
    respond_with(:admin, @event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(:admin, @event)
  end

  def update
    @event.update(event_params)
    respond_with(:admin, @event)
  end

  def destroy
    @event.destroy
    respond_with(:admin, @event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :start_date, :end_date)
    end
end
