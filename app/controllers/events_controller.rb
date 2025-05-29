class EventsController < ApplicationController
  before_action :authenticate_user! # First run Devise auth check
    
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
    
    # else show the event create page
    if @event.save
      redirect_to @event, notice: "Event created successfully."
    else
      render :new
    end
  end
  
  # def params for css styilng
  def show
    @event = Event.find(params[:id])
    @organizer = @event.organizer
    @hls_url = @event.stream_url
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if current_user.role == 'organizer'
      @event.destroy
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :stream_url)
  end
end
