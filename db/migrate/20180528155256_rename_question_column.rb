class RenameQuestionColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :questions, :answers_id, :answer_id
  end
end
