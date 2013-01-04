class NewsController < ApplicationController

  def index
    feeds = current_user.feed(current_user.friendships)
    @feeds = Kaminari.paginate_array(feeds).page(params[:page]).per(3)
    @news = News.new
    @comment = Comment.new
  end

  def create
    # news = News.new(current_user, params[:status])
    # news.create_news
  end

end

