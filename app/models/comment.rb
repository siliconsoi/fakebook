class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :news_id
  belongs_to :news

  validates :body, :presence => true,
                  :length => { :minimum => 1 }

    def self.create_comments(user, news_id, body)
      comment = Comment.new
    comment.user_id = user.id
    comment.news_id = news_id
    comment.body = body
    comment.save
  end
end
