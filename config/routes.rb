Rails.application.routes.draw do

	post '/goals/set_goal_event/:id' => 'goals#set_goal_event', as: 'set_goal_event'

	devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :goals
  resources :events
  resources :users, only: [:index, :show]

  root to: 'home#index'

end
