class LessonsController < ApplicationController
  def create
    category = Category.find(params[:category_id])

    lesson = category.lessons.build(user: current_user)
    lesson.save
    lesson.create_activity(user: current_user)
    redirect_to new_lesson_answer_path(lesson)

  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end