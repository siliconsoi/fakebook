class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :post_id, :user
  belongs_to :post
  belongs_to :user

  validates :body, :presence => true,
                  :length => { :minimum => 1 }

  def self.for_user(user, comm)
      comment = Comment.new
      comment.user_id = user.id
      comment.body = comm[:body]
      comment.post_id = comm[:post_id]
      comment.save
      comment
  end

end
