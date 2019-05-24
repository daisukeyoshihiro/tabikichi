class WordsController < ApplicationController
  def index
    @categories = current_user.categories
    if params[:category] == nil
      @answers = current_user.answers.order(created_at: :desc).paginate(page: params[:page], per_page: 8)
      @title = 'All learned'
    else
      category = Category.find(params[:category])
      @answers = category.answers.where(lessons: {user_id: current_user.id}).order(created_at: :desc).paginate(page: params[:page], per_page: 8)
      @title = category.title
    end
  end
end
