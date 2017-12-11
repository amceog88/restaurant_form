class Eichhorn::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_eichhorn

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "分類設置完成"
      redirect_to eichhorn_categories_path

    else
      @categories = Category.all
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end