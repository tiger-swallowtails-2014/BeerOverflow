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
    session[:return_to] ||= request.referer
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Thanks for posting!"
    else
      flash[:alert] = "You must be logged in to use that function."
    end
    # redirect_to session.delete(:return_to)
    render :partial => 'answer_comment', locals: {question: @answer.question, answer: @answer, comment: @comment}
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
