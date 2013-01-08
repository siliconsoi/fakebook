class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  def self.friend(user)
    friends = Friendship.find_all_by_user_id(user)
    friends = Friendship.where("user")
    friends.collect do |friend|
        Post.find_all_by_user_id(friend.friend_id)
    end
  end
end