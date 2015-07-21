Rails.application.routes.draw do
  scope module: :front do
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    resources :events, only: [:index, :show]
    resources :event_reservations do
      collection do
        post :purchase
      end
    end
    root to: 'pages#top'
  end
  namespace :admin do
    resources :sessions, only: [:create]
    get 'sign_in', to: 'sessions#new'
    delete 'sign_out', to: 'sessions#destroy'
    resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :event_days, only: [:create, :destroy]
    end
    resources :photos, only: [:destroy, :create]
    root to: 'pages#top'
  end
end
