Fakebook::Application.routes.draw do

  root :to => 'news#index'
  devise_for :users

    resources :news
    resources :comments, :only => [:create, :delete]
    resources :find_friends
    resources :friendships

end
