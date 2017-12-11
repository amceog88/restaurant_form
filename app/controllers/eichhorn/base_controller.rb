class Eichhorn::BaseController < ApplicationController
  before_action :authenticate_eichhorn

  private
  
  def authenticate_eichhorn
    unless current_user.eichhorn?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

end