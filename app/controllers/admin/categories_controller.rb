class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      redirect_to admin_categories_url
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_url
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
