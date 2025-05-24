class ApplicationController < ActionController::Base
  def index
    # your code here
  end
  def after_sign_in_path_for(resource)
    root_path
  end
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
