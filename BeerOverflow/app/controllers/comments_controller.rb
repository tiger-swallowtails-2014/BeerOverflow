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
  
end
