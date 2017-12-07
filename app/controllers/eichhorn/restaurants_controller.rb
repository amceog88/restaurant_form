class Eichhorn::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_eichhorn

  def index
    @restaurants = Restaurant.all
  end
  
end
