Rails.application.routes.draw do
  root 'home#index'
  get '/logout' ,to: 'home#logout'

  devise_for :users

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
end
