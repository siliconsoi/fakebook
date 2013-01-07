class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :post_id, :user
  belongs_to :post
  belongs_to :user

  validates :body, :presence => true,
                  :length => { :minimum => 1 }

end
