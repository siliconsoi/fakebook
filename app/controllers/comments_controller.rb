class CommentsController < ApplicationController
  def new
  end

  def create
    Comment.new(params[:comment].merge(:user => current_user)).save
    redirect_to news_index_path
  end
end
