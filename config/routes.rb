Fakebook::Application.routes.draw do

  root :to => 'posts#index'
  devise_for :users , :controllers => {:registrations => "registrations"}
  resources :admins
  resources :posts
  resources :comments,        :only => [:create, :destroy]
  resources :find_friends,    :only => [:index]
  resources :friendships ,     :only => [:new,:update, :destroy, :index]

  get 'manage_users', :to => 'admins#manage_users', :as => :manage_users


end
