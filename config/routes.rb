Rails.application.routes.draw do
  resources :alerts
  resources :pings
  resources :checkins
  resources :patrollers
  resources :dispatchers
  resources :destinations
  resources :memberships
  resources :groups
  resources :skiers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
