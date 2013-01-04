class FindFriendsController < ApplicationController
  def index
    @friendship = Friendship.new
    if !params[:keyword].nil?
      @results = current_user.find_new_friends(params[:keyword])
    end
  end
end
