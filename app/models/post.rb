class Post < ActiveRecord::Base
  attr_accessible :status, :user_id
  belongs_to :user
  has_many :comments

  validates :status, :presence => true,
                    :length => { :minimum => 1 }

  def self.create_post(user, status)
    post = Post.new
    post.user_id = user.id
    post.status = status
    post.save
    post
  end

end
