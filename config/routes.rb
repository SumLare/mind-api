Rails.application.routes.draw do
  namespace :api do
    resource :user, only: [:show, :create, :update]

    resources :questions, only: [:index, :create, :destroy] do
      resource :answer, only: [:create]
      resources :upvotes, only: [:create]
    end

    resources :answers, only: [] do
      resources :comments, only: [:create]
    end

    resources :comments, only: [] do
      resources :upvotes, only: [:create]
    end
  end
end
