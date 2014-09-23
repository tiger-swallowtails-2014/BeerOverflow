class AnswersController < ActionController::Base

  def index
    # this generally means, find all the things...here you're finding only one
    # thing?  Probably not actually using this....
    @question = Question.find(params[:id]) # seems like #show
  end

  def create
    # Seems wonky...
    session[:return_to] ||= request.referer
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @comment = Comment.new
    if @answer.save
      flash[:notice] = "Thanks for posting!"
    else
      flash[:alert] = "You must be logged in to use that function."
    end
    render partial: 'answers/displayanswers', locals: {question: @question, answer: @answer, comment: @comment}
  end

  def new
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def upvote
    @answer = Answer.find(params[:id])
    # @answer.upvote! should probably be implemented and
    # *IT* can do this creation and addition of a new vote
    # to itself.
    #
    # class Answer
    #
    # def upvote_for_user!(user)
    #   votes.create(value: 1, user_id: user.id)
    # end
    @vote = @answer.votes.new(value: 1, user_id: session[:user_id])
    if @vote.save
      render :partial => 'votes/success'
    else
      render :partial => 'votes/failure'
    end    
  end

  def downvote
    @answer = Answer.find(params[:id])
    @vote = @answer.votes.new(value: -1, user_id: session[:user_id])
    if @vote.save
      render :partial => 'votes/success'
    else
      render :partial => 'votes/failure'
    end   
  end

  # Really this is #update, make update handle when best: is / is not set and
  # then you can get rid of this method.
  def best
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update_attributes(best: true)
    @question.update_attributes(has_best_answer: true)
    redirect_to @answer.question
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(answer_params)
    redirect_to @answer.question
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:answer, :user_id)
  end

end
