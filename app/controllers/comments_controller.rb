class CommentsController < ApplicationController
  include CommentsHelper

  def create 
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save

    flash.notice = "Your comment was submitted!"

    redirect_to article_path(@comment.article)
  end

  before_action :require_login, except: [:create]

end
