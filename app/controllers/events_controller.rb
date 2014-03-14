class EventsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.all

    respond_to do |format|
      format.html
      format.json# { render json: @events }
    end
  end

  def new
    @event = Event.new
    authorize @event
  end

  def search
    event_names = Event.names_beginning_with(params[:term])
    render :json => event_names
  end 

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def create
    @event = Event.create event_params
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to @event
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
