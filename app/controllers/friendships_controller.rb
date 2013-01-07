class FriendshipsController < ApplicationController

  def new
    # @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    # if @friendship.save
    #   flash[:notice] = "Added friend."
    #   redirect_to "http://www.facebook.com"
    # else
    #   flash[:error] = "Unable to add friend."
    #   redirect_to "http://www.google.com"
    # end
    #   # redirect_to root_url
  end

  def create-
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    friendship = current_user.friendships.find_by_friend_id(params[:id])
    friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to friendships_path
  end

  def show

  end

  def index
    @friends = current_user.friendships.collect do |friendship|
      User.find(friendship.friend_id)
    end

  end

end
