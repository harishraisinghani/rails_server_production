# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Seed entries with no associations - skiers, patrollers, dispatchers, destinations
Group.create(name: "Lighthouse Skiers", admin_id: 3)
Group.create(name: "Norway Ski Team", admin_id: 4)
Membership.create(skier_id: 1, group_id: 1)
Membership.create(skier_id: 2, group_id: 1)
Membership.create(skier_id: 3, group_id: 1)
Membership.create(skier_id: 4, group_id: 2)
Checkin.create(skier_id: 1, destination_id: 4, checkout: Time.now)#a closed checkin for each user
Checkin.create(skier_id: 2, destination_id: 4, checkout: Time.now)
Checkin.create(skier_id: 3, destination_id: 4, checkout: Time.now)
Checkin.create(skier_id: 4, destination_id: 4, checkout: Time.now)
Checkin.create(skier_id: 5, destination_id: 4, checkout: Time.now)
Checkin.create(skier_id: 6, destination_id: 4, checkout: Time.now)
Checkin.create(skier_id: 1, destination_id: 1, checkout: Time.now)#and some in other destinations
Checkin.create(skier_id: 2, destination_id: 1, checkout: Time.now)
Checkin.create(skier_id: 4, destination_id: 1, checkout: Time.now)
Checkin.create(skier_id: 2, destination_id: 4) #active checkins
Checkin.create(skier_id: 3, destination_id: 4)
Checkin.create(skier_id: 4, destination_id: 4)
Checkin.create(skier_id: 5, destination_id: 4)
Ping.create(checkin_id: 10, lat: 49.27200, long: -123.11827) #pings to support the alerts
Ping.create(checkin_id: 11, lat: 49.27159, long: -123.11527)
Ping.create(checkin_id: 12, lat: 49.28010, long: -123.12027)
Ping.create(checkin_id: 13, lat: 49.28191, long: -123.10927)
Ping.create(checkin_id: 10, lat: 49.28188, long: -123.11127)
Ping.create(checkin_id: 11, lat: 49.27691, long: -123.10727)
Ping.create(checkin_id: 2, lat: 49.28175, long: -123.10627)
Ping.create(checkin_id: 1, lat: 49.28209, long: -123.10527)
Alert.create(ping_id: 1, user_generated: true, state: "active", dispatcher_id: 1, patroller_id: 1) #user gen, not assigned
Alert.create(ping_id: 2, user_generated: false, state: "active", dispatcher_id: 1, patroller_id: 1) #auto, not assigned
Alert.create(ping_id: 3, user_generated: true, state: "active", dispatcher_id: 1, patroller_id: 2) #user gen, assigned
Alert.create(ping_id: 4, user_generated: false, state: "active", dispatcher_id: 1, patroller_id: 3) #auto, assigned
Alert.create(ping_id: 5, user_generated: true, state: "active", dispatcher_id: 1, false_alarm: true, patroller_id: 1) #false alarm, user gen
Alert.create(ping_id: 6, user_generated: false, state: "active", dispatcher_id: 1, false_alarm: true, patroller_id: 1) #false alarm, auto
Alert.create(ping_id: 7, user_generated: false, state: "inactive", dispatcher_id: 1, patroller_id: 2) #auto, assigned, investigated
Alert.create(ping_id: 8, user_generated: true, state: "inactive", dispatcher_id: 1, patroller_id: 3) #user gen, assigned

