class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :news_id
  belongs_to :news

  validates :body, :presence => true,
                  :length => { :minimum => 1 }

  # def initialize(user ,comments, news)
  #   @user = user
  #   @news = news
  #   @comments = comments
  # end

  #   def create_comments
  #   self.user_id = @user.id
  #   self.news = @news.id
  #   self.comments = @comments
  #   self.save
  # end
end
