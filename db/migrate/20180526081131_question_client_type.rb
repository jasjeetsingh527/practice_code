class QuestionClientType < ActiveRecord::Migration[5.1]
  def change
  	add_column :questions, :UserType, :integer
  end
end
