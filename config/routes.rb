Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, only: [:show] do 
    resources :posts, only: [:new, :show]
  end

  resources :users, only: [:show] do
    get '/followers' => 'followers#show'
    get '/following' => 'followers#show'
    get '/likes' => 'likes#show'
  end
end
