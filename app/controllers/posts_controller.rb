class PostsController < ApplicationController

  def index
    @feed = Feed.new(current_user).posts.page(params[:page]).per(3)

    if @feed.page(1).per(3).num_pages < 1
      @next_page = nil
    else
      @next_page = 2
    end #make it shorter and test is it works when the user has no post

    respond_to do |format|
      format.html {}
      format.json do
        self.formats = [:html]
        content = render_to_string :partial => 'partial/post', :locals => {
          :next_page => params[:page] ? params[:page].to_i + 1 : 2,
          :posts => @feed}
        render :json => {:post => content, :next_page => "/posts?page=#{params[:page].to_i + 1}"}
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
    # @friend_poster = Post.where("user_id in (?)", friend_id).order('id DESC')
    @friend_poster = Feed.all_post(friend_id)

    # id = User.find_by_username(params[:username]).id
    # @friend_poster = Post.find_by_sql("select p.user_id, pt.friend_id,p.status, pt.message from posts as p join post_tos as pt ON p.user_id = pt.user_id where friend_id = #{id} && p.user_id = #{id}");
  end


end
