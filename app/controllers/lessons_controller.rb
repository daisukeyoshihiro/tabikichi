class LessonsController < ApplicationController
  def create
    category = Category.find(params[:category_id])

    lesson = Lesson.find_by(user: current_user,category: category)
    if lesson then lesson.destroy end
    lesson = category.lessons.build(user: current_user)
    lesson.save
    redirect_to new_lesson_answer_path(lesson)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end