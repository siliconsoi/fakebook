class News < ActiveRecord::Base
  attr_accessible :status, :user_id
  belongs_to :user
  has_many :comments

  validates :status, :presence => true,
                    :length => { :minimum => 1 }


  def initialize(user, status)
    @user = user
    @status = status
  end

  def create_news
    self.user_id = @user.id
    self.status = @status
    self.save
  end
end
