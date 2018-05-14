class AddVotestoAnswers < ActiveRecord::Migration[5.1]
  def change
  	add_column :answers, :votes, :integer
  end
end
