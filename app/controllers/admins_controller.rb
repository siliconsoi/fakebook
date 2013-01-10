class AdminsController < ApplicationController

  def index

  end

  def show

  end

  def manage_users
    @users = User.all
  end
end
