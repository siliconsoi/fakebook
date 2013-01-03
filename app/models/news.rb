class News < ActiveRecord::Base
  attr_accessible :status, :user_id

  def self.status(user)
    user.news
  end
end
