class Answer < ApplicationRecord
	belongs_to :user
  	belongs_to :question
  	before_create :answer_id
  	
  	def answer_id
  		begin
  			self.alphaid="#{Date.today.strftime('%B')}_#{self.user.name.split(' ').first}_#{Answer.last.id+1}"
  		rescue
  			self.alphaid="#{Date.today.strftime('%B')}_#{self.user.name.split(' ').first}_0"
  		end
  	end
end
