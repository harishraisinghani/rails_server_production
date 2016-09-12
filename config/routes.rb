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
  resources :sessions, only: [:new, :create, :destroy]
  
  #Custom Dispatcher views
  match '/login', to: 'sessions#new', via: [:get]
  match '/main', to: 'dispatchers#main', via: [:get, :post]

  #Root of rails server is the login for the dispatcher
  root to: "sessions#new"

  #Custom routes for Rails API Server
  
  #Skier

  #Authenticate the skier from PhoneGap app
  get 'skiers/login', to: 'skiers#authenticate'

  #Obtain all the pings for a specific skier. Used for logic to plot last position of skier and to determine if skier needs help
  get 'skiers/:id/pings', to: 'skiers#skier_pings_index'

  #Creates an alert based on request from a specific skier for help
  get 'skiers/:id/request_alert', to: 'alerts#request_assistance'

  #Checks out a specific skier from a Checkin object at a destination
  get 'skiers/:id/checkout', to: 'skiers#skier_checkout'

  #A specific skier creates a new group and adds skiers to group by email address
  post 'skiers/:id/new_group', to: 'skiers#new_group'

  #Group

  #Obtain the last ping to a Checkin object for each skier in a group who's currently checked in
  get 'groups/:id/skiers/current_checkin/pings/last', to: 'groups#current_location'

  #Patroller

  #Send any alert information when requested by a patroller
  get 'patrollers/:id/alert', to: 'patrollers#receive_alert'

  #Destination

  #Get all active alerts at a specific destination
  get 'destinations/:id/alerts', to: 'destinations#get_all_active_alerts'

  #Get all pings at a specific destination
  get 'destinations/:id/pings', to: 'destinations#get_all_recent_pings'
end
