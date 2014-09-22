class CommentsController < ApplicationController
  
  def upvote
    @comment = Comment.find(params[:id])
    @comment.votes.create(value: 1)
    @question = Question.find(params[:question_id])
    redirect_to @question  
  end
  
  def downvote
    @comment = Comment.find(params[:id])
    @comment.votes.create(value: -1)
    @question = Question.find(params[:question_id])
    redirect_to @question
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
    redirect_to session.delete(:return_to)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
