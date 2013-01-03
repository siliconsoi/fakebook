class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  protected
  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      return news_index_path
    else
      'http://www.google.com'
    end
  end

end
