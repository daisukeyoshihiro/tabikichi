class Admin::WordsController < ApplicationController
  before_action :require_admin
  
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      redirect_to admin_category_words_url
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
      if @word.update(word_params)
        flash[:info] = 'successfully updated'
        redirect_to admin_category_words_url
      else
        render 'edit'
      end
  end

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
  end

  def destroy
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
    @word.destroy
    redirect_to admin_category_words_url
  end

  private

  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :correct_answer])
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
