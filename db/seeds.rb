Alert.create!([
  {false_alarm: nil, user_generated: true, state: "active", dispatcher_id: 1, patroller_id: 1, ping_id: 1},
  {false_alarm: nil, user_generated: false, state: "active", dispatcher_id: 1, patroller_id: 1, ping_id: 2},
  {false_alarm: nil, user_generated: true, state: "active", dispatcher_id: 1, patroller_id: 2, ping_id: 3},
  {false_alarm: nil, user_generated: false, state: "active", dispatcher_id: 1, patroller_id: 3, ping_id: 4},
  {false_alarm: true, user_generated: true, state: "active", dispatcher_id: 1, patroller_id: 1, ping_id: 5},
  {false_alarm: true, user_generated: false, state: "active", dispatcher_id: 1, patroller_id: 1, ping_id: 6},
  {false_alarm: nil, user_generated: false, state: "inactive", dispatcher_id: 1, patroller_id: 2, ping_id: 7},
  {false_alarm: nil, user_generated: true, state: "inactive", dispatcher_id: 1, patroller_id: 3, ping_id: 8}
])
Checkin.create!([
  {checkout: "2016-09-09 18:40:18", destination_id: 4, skier_id: 1},
  {checkout: "2016-09-09 18:40:18", destination_id: 4, skier_id: 2},
  {checkout: "2016-09-09 18:40:18", destination_id: 4, skier_id: 3},
  {checkout: "2016-09-09 18:40:18", destination_id: 4, skier_id: 4},
  {checkout: "2016-09-09 18:40:18", destination_id: 4, skier_id: 5},
  {checkout: "2016-09-09 18:40:18", destination_id: 4, skier_id: 6},
  {checkout: "2016-09-09 18:40:18", destination_id: 1, skier_id: 1},
  {checkout: "2016-09-09 18:40:18", destination_id: 1, skier_id: 2},
  {checkout: "2016-09-09 18:40:18", destination_id: 1, skier_id: 4},
  {checkout: nil, destination_id: 4, skier_id: 2},
  {checkout: nil, destination_id: 4, skier_id: 3},
  {checkout: nil, destination_id: 4, skier_id: 4},
  {checkout: nil, destination_id: 4, skier_id: 5}
])
Destination.create!([
  {name: "Whistler/Blackcomb", lat: 50.0, long: -123.0, radius: 5000.0},
  {name: "Big White", lat: 49.735, long: -118.944, radius: 3000.0},
  {name: "Silver Star", lat: 50.375, long: -119.048, radius: 2500.0},
  {name: "Lighthouse Ski Resort", lat: 49.282, long: -123.10827, radius: 200.0}
])
Dispatcher.create!([
  {firstname: "Rodney", lastname: "Farva", username: "ramrod", password_digest: "$2a$10$2xOmNGEimGG07lQfvNIPNO.HsfbYV3wuUFohCZU4vgoxfGklfR1mW", on_shift: true, destination_id: 4},
  {firstname: "Larry", lastname: "Johnson", username: "larjon", password_digest: "$2a$10$fQ../6HC6a2UBs3lVnUcpuwFr31epFQsF7RZP3exRIdmt8QtKq09m", on_shift: false, destination_id: 4}
])
Group.create!([
  {name: "Lighthouse Skiers", admin_id: 3},
  {name: "Norway Ski Team", admin_id: 4}
])
Membership.create!([
  {group_id: 1, skier_id: 1},
  {group_id: 1, skier_id: 2},
  {group_id: 1, skier_id: 3},
  {group_id: 2, skier_id: 4}
])
Patroller.create!([
  {firstname: "MacIntyre", lastname: "Womack", username: "mac", password_digest: "$2a$10$7uCD5RZbX2.n85QuDzPLNeAvQ2YDRLSwPYGxN1Ch7QPSUdEaZzAr.", on_shift: true, destination_id: 4},
  {firstname: "Jeff", lastname: "Foster", username: "foster", password_digest: "$2a$10$0nRaehqwOTjVWPwlR8I2xeEf86pCXoumYdmnDuLVXOFa8mXhKJ1/m", on_shift: false, destination_id: 4},
  {firstname: "Robert", lastname: "Roto", username: "rabbit", password_digest: "$2a$10$N/ZMGAmVGlmVploRFjjDKet5odJjgGO91k17qZaTd9InLW.Yq/pai", on_shift: true, destination_id: 1},
  {firstname: "John", lastname: "O'Hagen", username: "captain", password_digest: "$2a$10$o4NTNtI5YCbZUiFXGzUL9eGDpNgx9/arQLV9E9pZ4nCwLcvg1UVf6", on_shift: false, destination_id: 1},
  {firstname: "Default", lastname: "Default", username: "unassigned", password_digest: "$2a$10$oZouNrP6tDwmpPuz4Sa3CuLQTR7DNj/IfAvs1CQm4UDapTfQz3jeK", on_shift: true, destination_id: 4}
])
Ping.create!([
  {lat: 49.272, long: -123.11827, checkin_id: 10},
  {lat: 49.27159, long: -123.11527, checkin_id: 11},
  {lat: 49.2801, long: -123.12027, checkin_id: 12},
  {lat: 49.28191, long: -123.10927, checkin_id: 13},
  {lat: 49.28188, long: -123.11127, checkin_id: 10},
  {lat: 49.27691, long: -123.10727, checkin_id: 11},
  {lat: 49.28175, long: -123.10627, checkin_id: 2},
  {lat: 49.28209, long: -123.10527, checkin_id: 1}
])
Skier.create!([
  {firstname: "Jacob", lastname: "Robinson", email: "jacob@example.com", password_digest: "$2a$10$rcZXrZucDmkCzkHeynN6pOAV7TkH72PFadW.I5eJKsPaCJweGckPC", ec1: "Larry", ec1phone: "6041112222", ec2: "", ec2phone: "", current_checkin_id: nil, username: "jacob", profile_picture: "", phone: "2505550155"},
  {firstname: "Simon", lastname: "Edmondson", email: "simon@example.com", password_digest: "$2a$10$cTPab6w7VD4HoPnC0I5bdOVQdQ56V.puq5X11W/Ezx1txvjSfFOvu", ec1: "Larry", ec1phone: "6045555555", ec2: "", ec2phone: "", current_checkin_id: 5, username: "simon", profile_picture: "", phone: "6044444444"},
  {firstname: "Harish", lastname: "Raisinghani", email: "harish@example.com", password_digest: "$2a$10$FS5rOlZ5cOC72eKxIkS4sO2LGWfVkR4A9MJFVkCZRkmTsb5TeBe/C", ec1: "Larry", ec1phone: "6043333333", ec2: "", ec2phone: "", current_checkin_id: 6, username: "harish", profile_picture: "", phone: "2505550157"},
  {firstname: "Silje", lastname: "Norendal", email: "silje@example.com", password_digest: "$2a$10$li2i6.8QUJiwfL0NCgYzQuntZ2.hEMy2J.T7KHMc5xU6.OtQ4LcCi", ec1: "Larry", ec1phone: "6045555555", ec2: "", ec2phone: "", current_checkin_id: 7, username: "silje", profile_picture: "", phone: "2505550158"},
  {firstname: "Bode", lastname: "Miller", email: "bode@example.com", password_digest: "$2a$10$8AWbqsPAyaw0hektpoy6hOtAI8nisriUurMjqFToFdeMfkMHHyY3S", ec1: "Larry", ec1phone: "6045555555", ec2: "", ec2phone: "", current_checkin_id: 8, username: "bmiller", profile_picture: "", phone: "2505550159"},
  {firstname: "Nancy", lastname: "Greene", email: "nancy@example.com", password_digest: "$2a$10$pXF54wipa5VXKDtYP5sWDusmnZOwzEKEafFrckdQ6xurbAv6posnq", ec1: "Larry", ec1phone: "6045555555", ec2: "", ec2phone: "", current_checkin_id: nil, username: "nancy", profile_picture: "", phone: "2505550160"}
])
