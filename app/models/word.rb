class Word < ApplicationRecord
  belongs_to :category
  belongs_to :answer
  has_many :lessons, through: :answers
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices
  validates :content, presence: true, uniqueness: true, length:{ maximum: 15}
  validate :validate_only_one_correct

  private

  def validate_only_one_correct
    if correct_answer.size != 1
      errors.add(:correct_answer, 'should have only one correct answer')
    end
  end

  def correct_answer
    choice_array = choices.collect { |c| c.correct_answer || nil }
    choice_array.compact
  end
  
end
