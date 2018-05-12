class Question < ApplicationRecord
	belongs_to :user
	has_many :answers,dependent: :destroy
	before_create :question_id
  	#enum status:{  private:0,expire:2,active:1	}
  	def question_id
  		begin
  			self.alphaid="Q_#{self.user.name.split(' ').first.upcase}_#{Question.last.id+1}"
  		rescue
  			self.alphaid="Q_#{self.user.name.split(' ').first.upcase}_1"
  		end
  	end
end
