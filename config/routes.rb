Fakebook::Application.routes.draw do

  root :to => 'news#index'
  devise_for :users
  resources :news
  resources :comments,        :only => [:create, :destroy]
  resources :find_friends,    :only => [:show]
  resources :friendships,     :only => [:create, :destroy, :index]
end
