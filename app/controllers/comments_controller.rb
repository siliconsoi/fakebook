class CommentsController < ApplicationController
  def new
  end

  def create
    Comment.new(params[:comment].merge(:user => current_user)).save
    redirect_to posts_path
  end
end
