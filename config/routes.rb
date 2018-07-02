Rails.application.routes.draw do
  namespace :api do
    resource :user, only: [:show, :create, :update]
    resources :questions, only: [:index, :create]
  end
end
