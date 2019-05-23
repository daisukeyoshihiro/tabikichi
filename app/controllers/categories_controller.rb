class CategoriesController < ApplicationController
  def index
    if params[:status] == nil
      @categories = Category.joins(:words)
    elsif params[:status] == 'learned'
      @categories = current_user.lessons.where.not(result: nil).collect { |c| c.category }
    else
      #@categories = Category.left_outer_joins(:lessons).merge(Lesson.where(result: nil)).joins #without user's info
      @categories = Category.joins("LEFT OUTER JOIN lessons ON categories.id = lessons.category_id AND lessons.user_id = #{current_user.id}").where(lessons: {result: nil}).joins(:words)
    end
  end
end