class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  belongs_to :user

  def self.friend(user)
    friends = Friendship.find_all_by_user_id(user)
    friends.collect do |friend|
        News.find_all_by_user_id(friend.friend_id)
    end
  end
end