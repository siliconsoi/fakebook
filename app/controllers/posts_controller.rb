class PostsController < ApplicationController

  def index
    @feeds = current_user.feed(current_user.friendships).page(params[:page]).per(3)
  end

  def new
  end

  def create
    News.create_news(current_user, params[:news][:status])
    redirect_to news_index_path
  end

end
