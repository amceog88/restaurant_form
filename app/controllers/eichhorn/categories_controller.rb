class Eichhorn::CategoriesController < ApplicationController
  before_action :authenticate_eichhorn
  before_action :set_category, only:[:update, :destroy]

  def index
    @categories = Category.all
    if params[:id]
      set_category
    else
      @category = Category.new
    end
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

  def update
    
    if @category.update(category_params)
      redirect_to eichhorn_categories_path
      flash[:notice] = "category was successfully updated"
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    
    @category.destroy
    flash[:alert] = "category was successfully deleted"
    redirect_to eichhorn_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end