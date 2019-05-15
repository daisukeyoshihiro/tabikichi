class Answer < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
  has_many :choices
end