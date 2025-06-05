class EventsController < ApplicationController
  before_action :authenticate_user! # First run Devise auth check
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_organizer, only: [:new, :create]
  before_action :require_organizer_or_event_owner, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user

    if @event.save
      redirect_to @event, notice: "Event created successfully."
    else
      render :new
    end
  end

  def show
    @organizer = @event.organizer
    @hls_url = @event.stream_url
  end

  def edit
    # @event is already set by before_action :set_event
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to dashboard_path, notice: 'Event was successfully deleted.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Event not found."
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :stream_url)
  end

  def require_organizer
    unless current_user.role == 'organizer'
      redirect_to root_path, alert: "Only organizers can perform this action."
    end
  end

  def require_organizer_or_event_owner
    unless current_user.role == 'organizer' && @event.organizer == current_user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end