Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buys, only: [:index, :create]
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end
