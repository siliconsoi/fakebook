class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id
  belongs_to :user

  def self.friend(user)
   f = Friendship.find_all_by_user_id(user)
    f.collect do |ff|
        News.find_all_by_user_id(ff.friend_id)
    end
  end
end