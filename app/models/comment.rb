class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :news_id
  belongs_to :news

  validates :body, :presence => true,
                  :length => { :minimum => 1 }
end
