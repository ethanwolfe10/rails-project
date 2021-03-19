Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, only: [:show] do 
    resources :posts, only: [:new, :show]
  end

end
