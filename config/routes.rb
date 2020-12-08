Rails.application.routes.draw do
  root 'pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
  resources :sessions, only: %i[new create destroy]
  resources :chats, only: %i[index show update destroy]
  resources :users do
    resources :messages, only: %i[index]
    get '/profile/edit', to: 'profiles#edit'
    patch '/profile', to: 'profiles#update'
  end
  get '/pages/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end