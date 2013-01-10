class AdminsController < ApplicationController


  def manage_users
    find_user = params[:keyword].nil? ? (User.all) : (User.search(params[:keyword]).to_a)
    @users = Kaminari.paginate_array(find_user).page(params[:page]).per(50)
  end

  def manage_posts

  end

  def manage_comments

  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.all
    @selected_id = @user.role.id
  end

  def update
    @user = User.find(params[:id])
    role = Role.find_by_id(params[:user].delete(:role))
    ru = RoleUser.find(@user)
    ru.role_id = role.id
    @user.update_attributes(params[:user]) && ru.save

    redirect_to :manage_users
  end
end
