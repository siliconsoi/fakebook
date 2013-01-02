Fakebook::Application.routes.draw do
  devise_for :users
  resources :news, :only => [:index]

  root :to => 'news#index'
end
