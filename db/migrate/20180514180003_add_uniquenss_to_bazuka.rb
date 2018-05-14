class AddUniquenssToBazuka < ActiveRecord::Migration[5.1]
  def change
  	add_index :votes, [:bazuka], :unique => true
  end
end
