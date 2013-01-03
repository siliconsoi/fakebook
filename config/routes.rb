Fakebook::Application.routes.draw do

  root :to => 'news#index'
  devise_for :users

  # resources :homes do
    resources :news do
      resources :commments
    end
    resources :accounts
    resources :find_friends
    resources :friendships
  # end

end
