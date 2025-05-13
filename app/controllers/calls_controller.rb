class CallsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!  # from Devise API

  def create
    ActionCable.server.broadcast 'call_channel', params[:data]
    head :ok
  end
end
