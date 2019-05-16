class AddResultToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :result, :integer
  end
end
