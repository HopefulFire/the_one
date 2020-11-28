Rails.application.routes.draw do
  resources :users do
    resources :profiles, only: %i[new create edit update]
  end

  resources :sessions, only: %i[new create]
  delete '/sessions/delete', to: 'sessions#destroy', as: 'delete_session'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
