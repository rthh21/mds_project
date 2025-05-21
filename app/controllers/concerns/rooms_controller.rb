# app/controllers/rooms_controller.rb
class RoomsController < ApplicationController
  def new
    redirect_to room_path(SecureRandom.uuid)
  end

  def show
    @room_id = params[:room]
  end
end
