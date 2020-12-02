Rails.application.routes.draw do
  root 'pages#home'
  resources :sessions, only: %i[new create]
  delete '/sessions/delete', to: 'sessions#destroy', as: 'session'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
