Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/blog' => 'blog#index'
  resources :posts do
    resources :comments
  end
  resources :views
end
