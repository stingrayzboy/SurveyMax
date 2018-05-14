class Answer < ApplicationRecord
    belongs_to :user
  	belongs_to :question
    has_many :votes,dependent: :destroy
  	before_create :answer_id
  	
  	def answer_id
  		begin
  			self.alphaid="A_#{self.user.name.split(' ').first.upcase}_#{Answer.last.id+1}"
  		rescue
  			self.alphaid="A_#{self.user.name.split(' ').first.upcase}_0"
  		end
  	end
end
