Rails.application.routes.draw do

  get 'sessions/new'
  root 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  post 'sessions/exit'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, except: [:index], shallow: true do
      resources :answers, except: [:index], shallow: true
    end

    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :score
    end
  end

end
