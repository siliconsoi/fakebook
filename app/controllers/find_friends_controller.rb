class FindFriendsController < ApplicationController
  def index
    find_friend = User.search(params[:keyword]).to_a
    friends = current_user.id
    all_friend =  Friendship.find_all_by_user_id(friends)

    usr = all_friend.collect {|af| User.find(af.friend_id)}

    recall = find_friend.collect do |res|
        if !usr.include?(res)
            res
        end
    end
    @results = recall.delete_if {|x| (x == nil || x.id == current_user.id) }
  end
end
