Rails.application.routes.draw do
  namespace :api do
    resource :user, only: [:show, :create, :update]

    resources :questions, only: [:index, :create, :destroy] do
      resources :answers, only: [:create]
      resources :upvotes, only: [:create]
    end

    resources :comments, only: [:create] do
      resources :upvotes, only: [:create]
    end
  end
end
