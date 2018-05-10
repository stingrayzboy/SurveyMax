class RemoveQuestionFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :question_id, :integer
    remove_column :users, :answer_id, :integer
  end
end
