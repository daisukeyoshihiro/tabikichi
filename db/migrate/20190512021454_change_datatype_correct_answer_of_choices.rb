class ChangeDatatypeCorrectAnswerOfChoices < ActiveRecord::Migration[5.2]
  def change
    change_column :choices, :correct_answer, :boolean
  end
end