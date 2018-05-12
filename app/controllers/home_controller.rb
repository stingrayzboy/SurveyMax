class HomeController < ApplicationController
before_action :authenticate_user!
before_action :set_question
before_action :set_answer
  def index
  	if logged_in?(:admin)
  		@question=Question.count
  		@answer=Answer.count
  		@user=User.count
  		@pie_chart={"Users"=>@user,"Total Answers"=>@answer,"Total Question"=>@question}

  		@line_user=User.group_by_day(:created_at).count
  		@column_question=Question.group_by_day_of_week(:created_at, format: "%a").count
  		@column_answer=Answer.group_by_day_of_week(:created_at, format: "%a").count

  	else

  		@myquestions=Question.where(user:current_user).count
  		@myanswers=Answer.where(question:Question.where(user:current_user)).count
  		@pie_chart={"My Questions"=>@myquestions,"Answers to my Questions"=>@myanswers}
  	end
  end

  def question
  	@new_question=Question.new
  	if logged_in?(:admin)
  		
  	else
  	
  	end
  end

  private

  def set_question
  	@questions=Question.all

  end

  def set_answer
  	@answer=Answer.all
  end

end
