class FindFriendsController < ApplicationController
  def index
      @people = User.all
  end
end
