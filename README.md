# README

This Rails API server is for the _**snowBlind()**_ final project that provides a unified platform for skiers, dispatchers and ski patrollers at a ski resort to improve safety and response times. 

This server also contains the Dispatcher's web views and dispatch functionality. 

The skier and ski patroller's applications are built using PhoneGap and the code stored in their corresponding repos. 

## Key API calls

_**Skier**_

##### Obtain all the pings for a specific skier. Used for logic to plot last position of skier and to determine if skier needs help
    get 'skiers/:id/pings', to: 'skiers#skier_pings_index'

##### Creates an alert based on request from a specific skier for help
    get 'skiers/:id/request_alert', to: 'alerts#request_assistance'

##### Checks out a specific skier from a Checkin object at a destination
    get 'skiers/:id/checkout', to: 'skiers#skier_checkout'

##### A specific skier creates a new group and adds skiers to group by email address
    post 'skiers/:id/new_group', to: 'skiers#new_group'

_**Group**_

##### Obtain the last ping to a Checkin object for each skier in a group who's currently checked in
    get 'groups/:id/skiers/current_checkin/pings/last', to: 'groups#current_location'

_**Patroller**_

##### Send any alert information when requested by a patroller
    get 'patrollers/:id/alert', to: 'patrollers#receive_alert'

_**Destination**_

##### Get all active alerts at a specific destination
    get 'destinations/:id/alerts', to: 'destinations#get_all_active_alerts'

##### Get all pings at a specific destination
    get 'destinations/:id/pings', to: 'destinations#get_all_recent_pings'

## Importing and exporting seed data

This server has the ability to import and export all seed data to/from the database. Use the following:
   
_**Export data:**_

    rails db:seed:dump IMPORT=true
   
_**Import data:**_ 
    
    rails db:seed


