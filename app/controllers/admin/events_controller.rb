class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  respond_to :html
  add_breadcrumb "Etkinlikler", :admin_events_path

  def index
    @search = Event.includes(:admin).ransack(params[:q])
    @events = @search.result.paginate(page: params[:page])
    respond_with(:admin, @events)
  end

  def show
    add_breadcrumb @event.name, admin_event_path(@event)
    respond_with(:admin, @event)
  end

  def new
    @event = Event.new(name: 'TEstsetestes')
    respond_with(:admin, @event)
    add_breadcrumb "Yeni Etkinlik", :new_admin_events_path
  end

  def edit
    add_breadcrumb "Düzeltme", :edit_admin_events_path
  end

  def create
    @event = current_admin.events.new(event_params)
    @event.save
    #respond_with(:admin, @event)
    respond_to do |format|
      format.js
    end
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
