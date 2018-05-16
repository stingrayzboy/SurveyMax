class HomeController < ApplicationController
before_action :authenticate_user!
  def index
  	if logged_in?(:admin)
      @admin_users=User.where(roles:"admin").order(name: :asc)
      @normal_users=User.where(roles:"user").order(name: :asc)
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
    @myquestions=Question.where(user:current_user).order(updated_at: :desc)
  	if logged_in?(:admin)
      @questions=Question.page(params[:page]).per(6).order(updated_at: :desc)
  	else
      @questions=Question.where(status:1).page(params[:page]).per(6).order(updated_at: :desc) 
  	end
  end
  def admin

    @user=User.find(params[:id])
    @user.roles="admin"
    if @user.save
    end
    redirect_to action:"index"
  end

  def user
    @user=User.find(params[:id])
    @user.roles="user"
    if @user.save
    end
    redirect_to action:"index"
  end
  
end
