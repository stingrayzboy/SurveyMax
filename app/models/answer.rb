class Answer < ApplicationRecord
	belongs_to :user
  	belongs_to :question
  	before_create :answer_id
  	
  	def answer_id
  		self.alphaid="#{Date.today.strftime('%B')}_#{self.user.name.split(' ').first}_#{Answer.last.id+1}"
  	end
end
