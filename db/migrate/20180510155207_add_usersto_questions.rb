class AddUserstoQuestions < ActiveRecord::Migration[5.1]
  def change
  	add_reference :questions, :user, index: true
  	add_reference :answers, :user, index: true
  end
end
