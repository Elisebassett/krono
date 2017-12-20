Rails.application.routes.draw do

	devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :goals
  resources :events
  resources :users, only: [:index, :show]

  root to: 'home#index'

end
