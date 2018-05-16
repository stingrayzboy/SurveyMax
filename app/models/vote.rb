class Vote < ApplicationRecord
	validates_uniqueness_of :bazuka 
	belongs_to :user
	belongs_to :answer
	before_save :boomla,:set_bazuka,:change_vote


	def boomla
		a=Answer.find_by_id(self.answer_id)
		if self.vote_type==1
			a.vote_count=a.vote_count+1
		else
			a.vote_count=a.vote_count-1
		end
		a.save
	end

	def set_bazuka
		self.bazuka="#{self.user_id}#{self.answer_id}#{self.vote_type}"		
	end
	

	def change_vote
		opposite=self.bazuka.split("")
		if (opposite.last=="1")
			opposite[-1]="0"
		else
			opposite[-1]="1"
		end
		opposite_vote=opposite.join

		opposite_vote_from_db=Vote.find_by_bazuka(opposite_vote)
		
		if opposite_vote_from_db
			answer=Answer.find_by_id(opposite_vote_from_db.answer_id)

			if answer
				if opposite_vote_from_db.vote_type==1
					answer.vote_count-=1
				else
					answer.vote_count+=1
				end
				answer.save
			end
		
			opposite_vote_from_db.destroy
		end
	end


end
