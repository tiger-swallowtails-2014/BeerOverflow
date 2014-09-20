class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
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
  
  private
  def question_params
    params.require(:question).permit(:question)
  end
end
