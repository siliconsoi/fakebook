class PostsController < ApplicationController

  def index
    per_page = 3
    current_page = params[:page] ? params[:page].to_i : 1
    next_page = current_page + 1

    if params[:page].nil?
      @feeds = Feed.new(current_user).posts.page(1).per(per_page)
      @next_page = params[:page] ? params[:page] + 1 : 2
    else
      more_posts = Feed.new(current_user).posts.page(params[:page]).per(per_page)
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.json do
          self.formats = [:html]
          content = render_to_string :partial => 'partial/post', :locals => {
            :next_page => params[:page] ? params[:page].to_i + 1 : 2,
            :posts => more_posts}
          render :json => {:post => content, :next_page => "/posts?page=#{params[:page].to_i + 1}"}
        end
      end
    end
  end

  def create
    post = Post.create_post(current_user, params[:posts][:status])
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json do
        self.formats = [:html]
        content = render_to_string :partial => 'partial/post', :locals => {:posts => [post]}
        render :json => {:post => content }
      end
    end
  end

  def show
    friend_id = User.find_by_username(params[:username]).id
    @friend_poster = Post.find_all_by_user_id(friend_id)
  end


end
