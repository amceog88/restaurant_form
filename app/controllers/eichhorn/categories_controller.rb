class Eichhorn::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_eichhorn
end
