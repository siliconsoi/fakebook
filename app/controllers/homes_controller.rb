class HomesController < ApplicationController
  def index
    cuser = current_user.posts
    @post = cuser.new
  end


  def create
    # @news = current_user.news.new
  end

end
