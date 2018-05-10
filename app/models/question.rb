class Question < ApplicationRecord
	belongs_to :user
	has_many :answers,dependent: :destroy
	before_create :question_id
  	#enum status:{  private:0,expire:2,active:1	}
  	def question_id
  		self.alphaid="#{Date.today.strftime('%B')}_#{self.user.name.split(' ').first}_#{Question.last.id+1}"
  	end
end
