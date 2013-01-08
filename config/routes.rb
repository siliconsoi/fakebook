Fakebook::Application.routes.draw do

  root :to => 'posts#index'
  devise_for :users
  resources :posts
  resources :comments,        :only => [:create, :destroy]
  resources :find_friends,    :only => [:index]
  resources :friendships ,     :only => [:update, :destroy, :index]

end
