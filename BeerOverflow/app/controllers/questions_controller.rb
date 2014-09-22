class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
    @vote = Vote.new
    @comment = Comment.new
  end

  def new
    @question = Question.new
  end

  def create
    session[:return_to] ||= request.referer
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Thanks for posting!"
    else
      flash[:alert] = "You must be logged in to use that function."
    end
    redirect_to session.delete(:return_to)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to @question
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end


  def upvote
    @question = Question.find(params[:id])
    @question.votes.create(value: 1)
    redirect_to @question
  end

  def downvote
    @question = Question.find(params[:id])
    @question.votes.create(value: -1)
    redirect_to @question
  end

  private
  def question_params
    params.require(:question).permit(:question, :user_id)
  end
end
