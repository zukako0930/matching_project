Rails.application.routes.draw do
  resources :block_lists
  resources :date_schedules
  resources :meet_requests
  root to: 'sessions#new'
  get 'messages/check'
  post 'messages/set_receive'
  get 'messages/set_receive'
  resources :messages
  get 'sessions/new'
  get 'match_requests/target_user_list'
  get 'users/:id/profile' => 'users#profile'
  resources :match_requests
  resources :users
  # post 'chat' => 'messages#index'
  post 'messages/index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy' #deleteの場合はmethod: :deleteが必要
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
