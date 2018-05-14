class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  after_save :boomla

  def boomla
  	a=Answer.find_by_id(self.answer_id)
  	if self.vote_type==1
  		a.vote_count=a.vote_count+1
  	else
  		a.vote_count=a.vote_count-1
  	end
  	a.save
  end
end
