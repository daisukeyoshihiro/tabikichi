class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :answers, through: :lessons
  validates :title, presence: true, length: {maximum: 15}
  validates :description, presence: true, length: {maximum: 50}
end