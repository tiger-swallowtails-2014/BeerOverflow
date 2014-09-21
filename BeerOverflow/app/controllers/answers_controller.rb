class AnswersController < ActionController::Base

  def index
    @question = Question.find(params[:id])
  end

  def create
    @answer = Question.find(params[:question_id]).answers.create(answer_params)
    redirect_to @answer.question
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

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(answer_params)
    redirect_to '/'
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end

end
