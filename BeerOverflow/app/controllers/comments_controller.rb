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
    p params
    @answer = Answer.find(params[:answer_id])
    @answer.comments.create(comment_params)
    redirect_to @answer.question
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
