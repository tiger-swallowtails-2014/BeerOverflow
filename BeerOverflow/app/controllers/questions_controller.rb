class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
    @vote = Vote.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    redirect_to '/'
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    redirect_to '/'
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to '/'
  end
  
  def upvote
    @question = Question.find(params[:id])
    @question.votes.create(value: 1)
    redirect_to '/'    
  end
  
  def downvote
    @question = Question.find(params[:id])
    @question.votes.create(value: -1)
    redirect_to '/'
  end
  
  private
  def question_params
    params.require(:question).permit(:question)
  end
end
