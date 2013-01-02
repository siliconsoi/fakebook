Fakebook::Application.routes.draw do
  root :to => 'welcomes#index'
  devise_for :users

  resources :homes do
    resources :accounts
    resources :find_friends
    resources :friendships
  end
end
