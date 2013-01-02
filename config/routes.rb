Fakebook::Application.routes.draw do
  resources :news, :only => [:index]
  root :news => 'news#index'
  devise_for :users
end
