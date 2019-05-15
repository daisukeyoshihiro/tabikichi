class AnswersController < ApplicationController
	def new
		@words = rest_of_word
		
		if rest_of_word.first.nil?
			redirect_to lesson_url(@lesson)
		end
	end

	def create
		lesson = Lesson.find(params[:lesson_id])
		answer = lesson.answers.create(answer_params)
		redirect_to new_lesson_answer_url(lesson)
	end

	private

	def rest_of_word
		@lesson = Lesson.find(params[:lesson_id])
		(@lesson.category.words - @lesson.words)
	end

	def answer_params
		params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
	end


end
