class FindFriendsController < ApplicationController
  def index
      if !params[:keyword].nil?
        @results = current_user.find_new_friends(keyword)
      end
  end
end
