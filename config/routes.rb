Rails.application.routes.draw do
  
  resources :events

  root to: 'home#index'

end
