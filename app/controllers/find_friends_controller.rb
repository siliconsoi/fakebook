class FindFriendsController < ApplicationController
  def index
      @people = User.find_by_sql(["SELECT DISTINCT(user_id) from Friendships WHERE user_id IS NOT ?", current_user.id])
  end
end
