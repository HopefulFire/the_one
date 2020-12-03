Rails.application.routes.draw do
  root 'pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sessions/new', to: 'sessions#new', as: 'login'
  delete '/sessions/delete', to: 'sessions#destroy', as: 'logout'
  resources :users, only: %i[show index edit update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
