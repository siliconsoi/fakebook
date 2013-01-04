class NewsController < ApplicationController

  def index
    feeds = current_user.feed(current_user.friendships)
    @feeds = Kaminari.paginate_array(feeds).page(params[:page]).per(3)
    @news = News.new
    @comment = Comment.new
  end

  def new
  end

  def create
    News.create_news(current_user, params[:news][:status])
    redirect_to news_index_path
  end

end
