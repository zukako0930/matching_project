Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :messages
  get 'sessions/new'
  get 'match_requests/target_user_list'
  get 'users/:id/profile' => 'users#profile'
  get 'messages/messageall'
  resources :match_requests
  resources :users
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy' #deleteの場合はmethod: :deleteが必要
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
