class Eichhorn::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_eichhorn

  def index
    
  end
  
end
