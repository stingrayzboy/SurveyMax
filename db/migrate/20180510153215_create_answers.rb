class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :name
      t.references :question, foreign_key: true
      t.string :alphaid

      t.timestamps
    end
  end
end
