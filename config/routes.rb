Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'

  resources :categories do
    resources :tasks do
      member do
        patch :toggle_completion
      end
    end
  end
  #covered by line 4
  # get '/categories', to: 'categories#index'
  # get '/categories/:id', to: 'categories#show'
end
