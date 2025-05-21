# app/controllers/admin/events_controller.rb
class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_organizer
  before_action :set_event

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Event updated successfully'
    else
      render :edit
    end
  end

  private

  def set_event
    @event = current_user.organized_events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :stream_url)
  end

  def require_organizer
    redirect_to root_path unless current_user.organizer?
  end
end
