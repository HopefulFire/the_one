Rails.application.routes.draw do
  root 'pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :sessions, only: %i[new create destroy]
  resources :users do
    get '/profile/edit', to: 'profile#edit'
    patch '/profile', to: 'profiles#update'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
