Rails.application.routes.draw do
  root 'static#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, only: [:show] do 
    resources :posts, only: [:new, :show, :create, :update]
  end

  resources :users, only: [:show] do
    resources :posts, only: [:index, :edit]
    resources :groups, only: [:new, :edit, :create]
    get '/followers' => 'follows#show'
    get '/following' => 'follows#show'
    get '/followers/add' => 'users#index'
    patch '/followers/add' => 'follows#add'
    get '/likes' => 'likes#show'
  end

  resources :posts, only: [:show] do
    resources :comments, only: [:new, :create, :index]
  end

 

  resources :users, only: [:edit, :update]
end
