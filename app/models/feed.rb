class Feed
  attr_reader :posts
  def initialize(user)
    run(user)
  end

  def run(user)
    friendships = user.friendships
    friend_ids = friendships.collect{|fs| fs.friend_id}
    friend_ids << user.id
    @posts = Post.where("user_id in (?)",friend_ids).order('id DESC')
  end

  def self.all_post(user_id)
    post = Post.where("user_id in (?)", user_id).order('id DESC')
  end

end
