class AddTypetoVote < ActiveRecord::Migration[5.1]
  def change
  	add_column :votes, :type, :integer
  end
end
