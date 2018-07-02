Rails.application.routes.draw do
  namespace :api do
    resource :user, only: [:show, :create, :update]
    resources :questions, only: [:index, :create, :destroy] do
      resources :answers, only: [:create]
    end
  end
end
