class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string "answer_text"
      t.timestamps
    end

    add_column :questions, :answers_id, :integer
  end
end
