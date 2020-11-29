Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/terms'
  get 'pages/privacy'

  resources :users do
    get '/profile/new', to: 'profiles#new'
    post '/profile', to: 'profiles#create'
    get '/profile/edit', to: 'profiles#edit'
    patch '/profile', to: 'profiles#update'
  end

  resources :sessions, only: %i[new create]
  delete '/sessions/delete', to: 'sessions#destroy', as: 'delete_session'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
