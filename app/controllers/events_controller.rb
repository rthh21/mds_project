class EventsController < ApplicationController
  before_action :authenticate_user!
    
  def new
    @event = Event.new
  end
    
  def create
    unless current_user.role == 'organizer'
      redirect_to root_path, alert: "Only organizers can create events."
      return
    end
  
    @event = Event.new(event_params)
    @event.organizer = current_user
  
    if @event.save
      redirect_to @event, notice: "Event created successfully."
    else
      render :new
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if current_user.role == 'organizer'
      @event.destroy
      redirect_to events_path, notice: 'Event deleted.'
    else
      redirect_to events_path, alert: 'You are not authorized to delete this event.'
    end
  end
  
  def show
    @event = Event.find(params[:id])
    @organizer = @event.organizer
    # For demo: statically assign a stream URL for event 1
    @hls_url = if @event.id == 1
      "https://tv.broadcasting.ro/kisstv/a629c031-2170-4ee9-a36d-87a891aa3131.m3u8"
    else
      nil
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :stream_url)
  end

end
