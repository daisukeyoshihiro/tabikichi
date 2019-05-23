class CategoriesController < ApplicationController
  def index
    if params[:status] == nil
      @categories = Category.joins(:words)
    elsif params[:status] == 'learned'
      @categories = current_user.lessons.where.not(result: nil).collect { |c| c.category }
      #@categories = Category.joins(:lessons is also possible to display
    else
      @categories = Category.left_outer_joins(:lessons).merge(Lesson.where(result: nil)).joins(:words)
    end
  end
end