class Post < ActiveRecord::Base
  attr_accessible :status, :user_id
  belongs_to :user
  has_many :comments

  validates :status, :presence => true,
                    :length => { :minimum => 1 }

  def self.create_news(user, status)
    news = News.new
    news.user_id = user.id
    news.status = status
    news.save
  end

end
