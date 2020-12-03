Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sessions/new', to: 'sessions#new', as: 'login'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
