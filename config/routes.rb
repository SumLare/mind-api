Rails.application.routes.draw do
  devise_for :admins, path: 'admin'

  devise_scope :admin do
    get '/admin', to: 'devise/sessions#new'
  end

  namespace :api do
    resources :users, only: [:show, :create] do
      resources :views, only: [:create]
    end

    resource :user, only: [:show, :update]
    resources :sessions, only: [:create]
    resources :upvotes, only: [:destroy]
    resources :comments, only: [:destroy]
    resource :search, only: [:show]
    resource :popular, only: [:show]
    resource :verification_token, only: [:create, :update]

    resources :questions, only: [:create, :destroy] do
      resource :answer, only: [:create]
      resources :upvotes, only: [:create]
    end

    resources :answers, only: [] do
      resources :comments, only: [:index, :create]
      resources :reports, only: [:create]
      resources :views, only: [:create]
    end

    resources :comments, only: [] do
      resources :upvotes, only: [:create]
      resources :reports, only: [:create]
    end

    resources :followings, only: [:index, :create, :destroy]
  end

  namespace :admin do
    resources :reports, only: [:index]
  end
end
