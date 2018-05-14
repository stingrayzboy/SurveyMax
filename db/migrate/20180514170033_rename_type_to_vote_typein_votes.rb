class RenameTypeToVoteTypeinVotes < ActiveRecord::Migration[5.1]
  def change
  	rename_column :votes, :type, :vote_type

  end
end
