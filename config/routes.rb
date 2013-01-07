Fakebook::Application.routes.draw do

  root :to => 'news#index'
  devise_for :users
  resources :posts
  resources :comments,        :only => [:create, :destroy]
  resources :find_friends,    :only => [:index]
  resources :friendships,     :only => [:create, :destroy, :index]

end
