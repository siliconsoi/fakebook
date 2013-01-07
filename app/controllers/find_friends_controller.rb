class FindFriendsController < ApplicationController
  def index
    @results = User.search(params[:keyword])
  end
end
