class EventsController < ApplicationController
  before_action :authenticate_user!

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
end
