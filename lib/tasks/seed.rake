namespace :fb do

    namespace :db do
      desc "nuke databases"
    task :nuke => ["db:drop", "db:create", "db:migrate", "fb:seed:default", "db:test:prepare"]
    end

    namespace :seed do

    desc "Creates a tables"
    task :default => [
      :create_users,
      :create_friendships,
      :create_posts,
      :create_comments,
      :create_post_tos,
      :create_roles,
      :assign_roles
    ]

    task :create_users => :environment do
      puts "Creating Users"
      User.new({:email => 'admin@fakebook.com', :firstname => 'Superuser', :lastname => 'Usersuper',
                  :password => 'test123test', :password_confirmation => 'test123test', :gender => 'male', :birthdate => '1980-10-12', :username => '1'}).save
      User.new({:email => 'member1@fakebook.com', :firstname => 'Tony', :lastname => 'Stark',
                  :password => 'test123test', :password_confirmation => 'test123test', :gender => 'male', :birthdate => '1975-01-18', :username => '2'}).save
      User.new({:email => 'member2@fakebook.com', :firstname => 'Bruce', :lastname => 'Wayne',
                  :password => 'test123test', :password_confirmation => 'test123test', :gender => 'male', :birthdate => '1977-02-20', :username => 'Wayne'}).save
      User.new({:email => 'member3@fakebook.com', :firstname => 'John', :lastname => 'Doe',
                  :password => 'test123test', :password_confirmation => 'test123test', :gender => 'male', :birthdate => '1956-03-25', :username => '4'}).save
      User.new({:email => 'member4@fakebook.com', :firstname => 'Lady', :lastname => 'Gaga',
                  :password => 'test123test', :password_confirmation => 'test123test', :gender => 'female', :birthdate => '1985-11-08', :username => 'l1gaga'}).save
      User.new({:email => 'member5@fakebook.com', :firstname => 'Bruce', :lastname => 'Lee',
                  :password => 'test123test', :password_confirmation => 'test123test', :gender => 'male', :birthdate => '1925-12-28', :username => 'LeeSung'}).save
    end

    task :create_friendships => :environment do
      puts "Creating Friendships"
      Friendship.new({:friend_id => 3, :user_id => 2}).save
      Friendship.new({:friend_id => 4, :user_id => 2}).save
      Friendship.new({:friend_id => 5, :user_id => 2}).save
      Friendship.new({:friend_id => 2, :user_id => 3}).save
    end

    task :create_posts => :environment do
      puts "Creating Posts"
      Post.new({:status => 'I am Tony', :user_id => 2}).save
      Post.new({:status => 'I am Wayne', :user_id => 3}).save
      Post.new({:status => 'I am Batman ^_^', :user_id => 3}).save
      Post.new({:status => 'I am John Doe', :user_id => 4}).save
      Post.new({:status => 'I am Gaga, i\'m a artist', :user_id => 5}).save
      Post.new({:status => 'I am Lee', :user_id => 6}).save
    end

    task :create_comments => :environment do
      puts "Creating Comments"
      Comment.new({:user_id => 2, :body => 'So cool', :post_id => 2}).save
      Comment.new({:user_id => 3, :body => 'So good!!', :post_id => 2}).save
      Comment.new({:user_id => 3, :body => 'Exactly!!!', :post_id => 3}).save
    end

    task :create_roles => :environment do
      puts "Creating roles"
      Role.new(:name => 'member').save
      Role.new(:name => 'banned').save
      Role.new(:name => 'superuser').save
    end

    task :assign_roles => :environment do
      puts "Assinging roles"
      RoleUser.new(:user_id => 1, :role_id => 3).save
      RoleUser.new(:user_id => 2, :role_id => 1).save
      RoleUser.new(:user_id => 3, :role_id => 1).save
      RoleUser.new(:user_id => 4, :role_id => 1).save
      RoleUser.new(:user_id => 5, :role_id => 1).save
      RoleUser.new(:user_id => 6, :role_id => 1).save
    end

    task :create_post_tos => :environment do
      puts "Creating PostTo"
      PostTo.new({:message => 'Hi Bruce',:friend_id => 3, :user_id => 2}).save
      PostTo.new({:message => 'How about u John',:friend_id => 4, :user_id => 2}).save
      PostTo.new({:message => 'I like u Gaga',:friend_id => 5, :user_id => 2}).save
      PostTo.new({:message => 'Hi Tony Jaa Hahah',:friend_id => 2, :user_id => 3}).save
      PostTo.new({:message => 'Hi Tony Jaa Hahah From 3',:friend_id => 2, :user_id => 2}).save
    end

  end

end
