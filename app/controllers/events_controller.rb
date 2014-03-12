class EventsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.for_today
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.create event_params
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
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
    redirect_to events_path
  end

  private
  
  def event_params
    params.require(:event).permit(:name, :address, :start_at, :end_at)
  end

end
