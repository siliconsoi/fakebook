class CommentsController < ApplicationController
  def new
  end

  def create
    # Comment.new(params[:comment].merge(:user => current_user)).save
    Comment.for_user(current_user, params[:comment])
    redirect_to posts_path
  end
end
