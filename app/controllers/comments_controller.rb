class CommentsController < ApplicationController
  def new
  end

  def create
    comments = Comment.create_comments(current_user, params[:comment][:news_id], params[:comment][:body])
    redirect_to news_index_path
  end
end
