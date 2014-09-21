class AnswersController < ActionController::Base

  def index
    @question = Question.find(params[:id])
  end

  def create
    p "GO HERE"
    p params
    Question.find(params[:question_id]).answers.create(answer_params)
    redirect_to '/'
  end

  def new
    @question = Question.find(params[:id])
    @answer = Answer.new
  end
  
  def upvote
    @answer = Answer.find(params[:id])
    @answer.votes.create(value: 1)
    redirect_to @answer.question    
  end
  
  def downvote
    @answer = Answer.find(params[:id])
    @answer.votes.create(value: -1)
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end

end
