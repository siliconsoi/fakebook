class PostsController < ApplicationController

def index
  per_page = 3
    if params[:page].nil?
      @feeds = Feed.new(current_user).posts.page(1).per(per_page)
    else
      @feeds = Feed.new(current_user).posts.page(params[:page]).per(per_page) do |feeds|
        !feeds.empty? {|feeds| more_feeds(feeds)}
        feeds.empty? {|feeds| more_feeds(feeds)}
      end
    end
    @next_page = Feed.new(current_user).posts.page(params[:page].to_i+2).per(per_page)
  end

  def new
  end

  def create
    post = Post.create_post(current_user, params[:posts][:status])
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json { render :json => {:post => post.as_json} }
    end
  end

  def more_feeds(feeds)

  end

end
