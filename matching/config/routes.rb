Rails.application.routes.draw do

  resources :messages
  get 'sessions/new'
  get 'users/target_user_list'
  get 'match_requests/target_user_list'

  resources :match_requests
  resources :users
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
