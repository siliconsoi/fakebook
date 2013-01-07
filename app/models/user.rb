class User < ActiveRecord::Base
  has_many :friendships
  has_many :posts
  # has_many :users, :source => :friendship , :through => :friendships, :foreign_key => "friend_id"
  has_many :friends, :through => :friendships, :foreign_key => "friend_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:avatar ,:firstname, :lastname, :password, :password_confirmation, :remember_me, :avatar_file_name,
                  :avatar_content_type, :avatar_file_size, :avatar_updated_at
  # Avatar
  has_attached_file :avatar,
                    :styles =>{
                    :hprofile  => "50x50",
                    :thumb  => "100x100",
                    :medium => "200x200",
                    :large => "400x400"},
                    :default_url => "http://www.classtools.net/main_area/fakebook/icons/silhouette.png",
                    :url  => "images/users/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/images/users/:id/:style/:basename.:extension"

  validates_attachment_size :avatar, :less_than => 1.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg']

  def self.search(search)
      return [] unless search
      User.where('firstname like ? or lastname like ? or email like ?', search, search, search)
    #   # @results = current_user.find_new_friends(params[:keyword])
    # end
    # if search == nil
    #   self.all
    # else
    #   search_condition = "%" + search + "%"
    #   self.find(:all, :conditions => ['email LIKE ? OR firstname LIKE ? OR lastname LIKE ?', search_condition, search_condition, search_condition])
    # end
  end

  def feed(friendships)
    sql = gen_sql(friendships)
    News.where(sql)
  end

  def gen_sql(friendships)
    # p 'T_______________________T'
    # p friendships
    # p '___________________________'
        friendships = friendships.collect do |friendship|
          "user_id = " + friendship.friend_id.to_s
        end

        if friendships.count > 0
          friendships.join(" or ") + " or user_id = " + self.id.to_s
        else
          friendships.join(" or ") + "user_id = " + self.id.to_s
        end
  end

  # def find_new_friends(keyword)
  #   keyword = "%"+keyword+"%"
  #   # User.find_by_sql(["SELECT DISTINCT(user_id) from Friendships WHERE user_id IS NOT ?", self.id])
  #   User.find_by_sql(["SELECT * from users where (firstname like ? or lastname like ? or email like ?) and (id <> ?)", keyword, keyword, keyword, self.id])
  # end

end
