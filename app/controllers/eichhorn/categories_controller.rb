class Eichhorn::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_eichhorn

  def index
    @categories = Category.all

    if params[:id]
      @category = Category.find(params[:id])
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
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to eichhorn_categories_path
      flash[:notice] = "category was successfully updated"
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:alert] = "category was successfully deleted"
    redirect_to eichhorn_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end