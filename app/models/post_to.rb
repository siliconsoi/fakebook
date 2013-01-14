class PostTo < ActiveRecord::Base
  attr_accessible :message, :friend_id, :user_id
  belongs_to :user

  validates :message, :presence => true,
            :length => { :minimum => 1 }
end
