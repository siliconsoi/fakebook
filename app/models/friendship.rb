class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  belongs_to :user

  def self.friend(user)
    user.friendships
  end
end
