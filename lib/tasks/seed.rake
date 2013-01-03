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
      :create_news
    ]

    task :create_users => :environment do
      puts "Creating Users"
      User.new({:email => 'member1@fakebook.com', :firstname => 'Tony', :lastname => 'Stark',
                  :password => 'test123test', :password_confirmation => 'test123test'}).save
      User.new({:email => 'member2@fakebook.com', :firstname => 'Bruce', :lastname => 'Wayne',
                  :password => 'test123test', :password_confirmation => 'test123test'}).save
      User.new({:email => 'member3@fakebook.com', :firstname => 'John', :lastname => 'Doe',
                  :password => 'test123test', :password_confirmation => 'test123test'}).save
      User.new({:email => 'member4@fakebook.com', :firstname => 'Lady', :lastname => 'Gaga',
                  :password => 'test123test', :password_confirmation => 'test123test'}).save
    end

    task :create_friendships => :environment do
      puts "Creating Friendships"
      Friendship.new({:friend_id => 2, :user_id => 1}).save
      Friendship.new({:friend_id => 3, :user_id => 1}).save
      Friendship.new({:friend_id => 4, :user_id => 1}).save
      Friendship.new({:friend_id => 1, :user_id => 2}).save
    end

    task :create_news => :environment do
      puts "Creating News"
      News.new({:status => 'I am number 1', :user_id => 1}).save
      News.new({:status => 'I am number 2', :user_id => 2}).save
      News.new({:status => 'I am number 2 again', :user_id => 2}).save
      News.new({:status => 'I am number 3', :user_id => 3}).save
      News.new({:status => 'I am number 4', :user_id => 4}).save
    end

  end

end