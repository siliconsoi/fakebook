class NewsController < ApplicationController

  def index

    # @news = [
    #   OpenStruct.new(:first_name => "George" ,:text => "Hello Kitty",
    #     :comments => [
    #         OpenStruct.new(:first_name => "Jill", :text => "So cute"),
    #         OpenStruct.new(:first_name => "Tom", :text => "I don't think so")
    #                  ]
    #   ),
    #   OpenStruct.new(:first_name => "Bill", :text => "Yeahh...!",
    #     :comments => [
    #         OpenStruct.new(:first_name => "Ali", :text => "What happen?")
    #                  ]
    #   )
    # ]

    @friends = current_user.friendships
    # @friends = Friendship.find_all_by_user_id(current_user)
    # @friends = User.find_by_sql(["SELECT * from Friendships as f JOIN Users as u ON f.user_id = u.id where f.user_id = ? or u.id = ?", current_user, current_user])
    # @friends = current_user.news
    # p '-fdsfsdfsdf--------------------------------------------'
    p @friends
    @news = News.new
    @comment = Comment.new
  end

  def create
    # news = News.new(current_user, params[:status])
    # news.create_news
  end

end






