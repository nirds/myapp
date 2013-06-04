Myapp::Application.routes.draw do
  resources :posts


  resources :topics 

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "posts#index"
  devise_for :users
  resources :users
end