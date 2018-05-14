class RenameVotesToVoteCountinAnswers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :answers, :votes, :vote_count
  end
end
