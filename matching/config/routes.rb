Rails.application.routes.draw do
  resources :messages
  resources :match_requests
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
