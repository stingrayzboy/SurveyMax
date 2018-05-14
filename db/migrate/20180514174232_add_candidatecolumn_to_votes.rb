class AddCandidatecolumnToVotes < ActiveRecord::Migration[5.1]
  def change
  	add_column :votes, :bazuka, :text
  end
end
