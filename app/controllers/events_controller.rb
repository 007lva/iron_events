class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.create event_params
    @event.save
    redirect_to events_path
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    @event.save
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    puts "DESTROYYYY"
    redirect_to events_path
  end

  private
  
  def event_params
    params.require(:event).permit(:name, :address, :start_at, :end_at)
  end
end
