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

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end

end
