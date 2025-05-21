class DashboardController < ApplicationController
  def show
    @events = Event.all
    @events_count = @events.count
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "You need to log in to view your dashboard"
      return
    end
  end
end
