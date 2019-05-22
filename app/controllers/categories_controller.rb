class CategoriesController < ApplicationController
  def index
    if params[:status] == nil
      @categories = Category.all
    elsif params[:status] == 'learned'
      @categories = current_user.lessons.where.not(result: nil).collect { |c| c.category }
      # @categories = Category.joins(:lessons) is also possible to display
    else
      @categories = Category.left_outer_joins(:lessons).merge(Lesson.where(id: nil))
    end
  end
end