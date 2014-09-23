class CommentsController < ApplicationController

  def upvote
    @comment = Comment.find(params[:id])
    @vote = @comment.votes.new(value: 1, user_id: session[:user_id])
    if @vote.save
      render :partial => 'votes/success'
    else
      render :partial => 'votes/failure'
    end
  end

  def downvote
    @comment = Comment.find(params[:id])
    @vote = @comment.votes.new(value: -1, user_id: session[:user_id])
    if @vote.save
      render :partial => 'votes/success'
    else
      render :partial => 'votes/failure'
    end
  end

  def create
    p params

    session[:return_to] ||= request.referer

    if params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      @comment = @answer.comments.create(comment_params)
      # I hate the name of this partial.  wtf is in there?
      render :partial => 'answer_comment', locals: {question: @answer.question, answer: @answer, comment: @comment}
    elsif
      params[:question_id]
      @question = Question.find(params[:question_id])
      @comment = @question.comments.create(comment_params)
      render :partial => 'question_comment', locals: {question: @question, comment: @comment}
    end

    # rm commented out code 
    # if @comment.save
    #   flash[:notice] = "Thanks for posting!"
    # else
    #   flash[:alert] = "You must be logged in to use that function."
    # end

  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
