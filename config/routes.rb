Rails.application.routes.draw do
  root 'leader_board#index'
  resources :games
  resources :members
end
