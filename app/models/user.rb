require 'role_user'
require "role"

class User < ActiveRecord::Base
  belongs_to :role
  has_one :role_user
  has_one :role, :through => :role_user

  has_many :friendships
  has_many :posts
  has_many :friends, :through => :friendships
  # has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  # has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:avatar ,:firstname, :lastname, :password, :password_confirmation, :gender, :birthdate, :remember_me, :avatar_file_name,
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

  validates :firstname, :length => { :minimum => 1 }
  validates :lastname, :length => { :minimum => 1 }
  validates :gender, :inclusion => { :in => ['male', 'female'] }
  validates_attachment_size :avatar, :less_than => 1.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/jpg']


  def add_role(role_name)
    RoleUser.new({:user_id => self.id, :role_id => Role.find_by_name(role_name).id}).save
  end

  def self.search(search)
      return [] unless search
      k = "%#{search}%"
      User.where("firstname LIKE ? or lastname LIKE ? or email LIKE ?", k, k, k)
  end


  def feed(friendships)
    sql = gen_sql(friendships)
    Post.where(sql).order('created_at DESC')
  end


  def gen_sql(friendships)
        friendships = friendships.collect do |friendship|
          "user_id = " + friendship.friend_id.to_s
        end

        if friendships.count > 0
          friendships.join(" or ") + " or user_id = " + self.id.to_s
        else
          friendships.join(" or ") + "user_id = " + self.id.to_s
        end
  end

end
