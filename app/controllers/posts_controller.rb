class PostsController < ApplicationController

  def index
    @feeds = current_user.feed(current_user.friendships).page(params[:page]).per(3)
  end

  def new
  end

  def create
    p params.inspect
    Post.create_post(current_user, params[:posts][:status])
    redirect_to posts_path
  end

end
