class News < ActiveRecord::Base
  attr_accessible :status, :user_id
  belongs_to :user
  has_many :comments

  validates :status, :presence => true,
                    :length => { :minimum => 1 }


  def self.status(user)
    @status = user.news.new
    # @status.status = :status
    # @status.save
  end
end
