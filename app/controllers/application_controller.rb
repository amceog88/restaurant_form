class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  
  def authenticate_eichhorn
    unless current_user.eichhorn?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end
end
