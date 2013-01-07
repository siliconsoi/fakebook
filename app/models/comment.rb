class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :news_id, :user
  belongs_to :news
  belongs_to :user

  validates :body, :presence => true,
                  :length => { :minimum => 1 }

end
