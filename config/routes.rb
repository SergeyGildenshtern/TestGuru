Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users,
             path: :gurus,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: { sessions: 'user/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :score
    end
  end

  namespace :admin do
    root 'tests#index'

    resources :tests do
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end
end
