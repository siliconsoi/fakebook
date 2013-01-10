class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  protected
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      role = RoleUser.find_by_user_id(current_user.id).role_id
      if role == 3
        return admins_path
      else
        return posts_path
      end
    else
      'http://www.google.com'
    end
  end

end
