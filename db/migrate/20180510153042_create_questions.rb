class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :name
      t.integer :status
      t.string :alphaid

      t.timestamps
    end
  end
end
