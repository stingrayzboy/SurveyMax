class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
    @question=Question.find(params[:id])
    @answers=Answer.where(question:@question).order(vote_count: :desc)
    @my_answer=Answer.new

  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to controller:"home",action:"question"
    else
      render :new
    end
  end

  # POST /questions/answer/1

    def answer
      @answer = Answer.new(answer_params)
      @answer.user=current_user
      @answer.vote_count=0
      if @answer.save
        redirect_to question_path
      else
        render :new
      end
    end


  def cast_vote
    @vote=Vote.new(answer_id:params[:answer_id],vote_type:params[:vote_type],user_id:current_user.id)
    begin
      if @vote.save
        logger.info "Vote was cast"
      else
      end
    rescue
      logger.error "Tried to vote with the same entries again"  
    end
    @answer=Answer.find_by_id(params[:answer_id])
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to controller:"home",action:"question"
    else
      render controller:"home",action:"question"
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end
    
    def set_vote_answer
      @answer_vote = Answer.find(params[:answer_id])
    end
    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:name,:user_id,:status)
    end

    def answer_params
      params.require(:answer).permit(:name,:question_id,:votes)
    end
    def vote_params
      params.require(:cast_vote).permit(:vote_type,:answer_id)
    end
end
