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
    @news = News.new
    @comment = Comment.new
  end

  def create
    redirect_to "http://www.yahoo.com"
  end

end






