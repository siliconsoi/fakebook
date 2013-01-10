class CommentsController < ApplicationController
  def new
  end

  def create
    Comment.for_user(current_user, params[:comment])
    redirect_to posts_path
  end

  def destroy
    Comment.find(params[:id]).delete
    redirect_to posts_path
  end
end
