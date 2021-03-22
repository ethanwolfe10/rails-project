Rails.application.routes.draw do
  root 'static#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, only: [:show] do 
    resources :posts, only: [:new, :show, :create, :edit]
  end

  resources :groups, only: [:new, :edit, :create]

  resources :users, only: [:show] do
    resources :posts, only: [:index]
    get '/followers' => 'followers#show'
    get '/following' => 'followers#show'
    get '/likes' => 'likes#show'
  end

  resources :users, only: []
end
