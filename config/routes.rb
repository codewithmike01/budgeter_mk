Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: %i[index show] do
    resources :groups, only: %i[ new create  show ] do 
      resources :categories, only: %i[ new create ]
    end
  end

  root 'homes#index'
end
