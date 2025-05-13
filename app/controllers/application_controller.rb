class ApplicationController < ActionController::Base
  def index
    # your code here
  end
  def after_sign_in_path_for(resource)
    # Change this to your desired path
  end
end
