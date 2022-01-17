Rails.application.routes.draw do

  root 'tests#index'

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
