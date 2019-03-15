Rails.application.routes.draw do
  devise_for :users
  root to: 'blog#index'
  resources :posts do
    resources :comments
  end
  resources :views
end
