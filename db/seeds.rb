Alert.import([:false_alarm, :user_generated, :state, :dispatcher_id, :patroller_id, :ping_id], [
  [nil, true, "active", 1, 1, 1],
  [nil, false, "active", 1, 1, 2],
  [nil, true, "active", 1, 2, 3],
  [nil, false, "active", 1, 3, 4],
  [true, true, "active", 1, 1, 5],
  [true, false, "active", 1, 1, 6],
  [nil, false, "inactive", 1, 2, 7],
  [nil, true, "inactive", 1, 3, 8]
])
Checkin.import([:checkout, :destination_id, :skier_id], [
  ["2016-09-09 18:40:18", 4, 1],
  ["2016-09-09 18:40:18", 4, 2],
  ["2016-09-09 18:40:18", 4, 3],
  ["2016-09-09 18:40:18", 4, 4],
  ["2016-09-09 18:40:18", 4, 5],
  ["2016-09-09 18:40:18", 4, 6],
  ["2016-09-09 18:40:18", 1, 1],
  ["2016-09-09 18:40:18", 1, 2],
  ["2016-09-09 18:40:18", 1, 4],
  [nil, 4, 2],
  [nil, 4, 3],
  [nil, 4, 4],
  [nil, 4, 5]
])
Destination.import([:name, :lat, :long, :radius], [
  ["Whistler/Blackcomb", 50.0, -123.0, 5000.0],
  ["Big White", 49.735, -118.944, 3000.0],
  ["Silver Star", 50.375, -119.048, 2500.0],
  ["Lighthouse Ski Resort", 49.282, -123.10827, 200.0]
])
Dispatcher.import([:firstname, :lastname, :username, :password_digest, :on_shift, :destination_id], [
  ["Rodney", "Farva", "ramrod", "$2a$10$2xOmNGEimGG07lQfvNIPNO.HsfbYV3wuUFohCZU4vgoxfGklfR1mW", true, 4],
  ["Larry", "Johnson", "larjon", "$2a$10$fQ../6HC6a2UBs3lVnUcpuwFr31epFQsF7RZP3exRIdmt8QtKq09m", false, 4],
  ["Bert", "Reynolds", "breynolds", "$2a$10$SmQn1kMY14Rl2U/0MXZL9uQZZZbw9Z7FZFv7pJoURMtj1SDYthksS", false, 4]
])
Group.import([:name, :admin_id], [
  ["Lighthouse Skiers", 3],
  ["Norway Ski Team", 4]
])
Membership.import([:group_id, :skier_id], [
  [1, 1],
  [1, 2],
  [1, 3],
  [2, 4]
])
Patroller.import([:firstname, :lastname, :username, :password_digest, :on_shift, :destination_id], [
  ["MacIntyre", "Womack", "mac", "$2a$10$7uCD5RZbX2.n85QuDzPLNeAvQ2YDRLSwPYGxN1Ch7QPSUdEaZzAr.", true, 4],
  ["Jeff", "Foster", "foster", "$2a$10$0nRaehqwOTjVWPwlR8I2xeEf86pCXoumYdmnDuLVXOFa8mXhKJ1/m", false, 4],
  ["Robert", "Roto", "rabbit", "$2a$10$N/ZMGAmVGlmVploRFjjDKet5odJjgGO91k17qZaTd9InLW.Yq/pai", true, 1],
  ["John", "O'Hagen", "captain", "$2a$10$o4NTNtI5YCbZUiFXGzUL9eGDpNgx9/arQLV9E9pZ4nCwLcvg1UVf6", false, 1],
  ["Default", "Default", "unassigned", "$2a$10$oZouNrP6tDwmpPuz4Sa3CuLQTR7DNj/IfAvs1CQm4UDapTfQz3jeK", true, 4]
])
Ping.import([:lat, :long, :checkin_id], [
  [49.272, -123.11827, 10],
  [49.27159, -123.11527, 11],
  [49.2801, -123.12027, 12],
  [49.28191, -123.10927, 13],
  [49.28188, -123.11127, 10],
  [49.27691, -123.10727, 11],
  [49.28175, -123.10627, 2],
  [49.28209, -123.10527, 1]
])
Skier.import([:firstname, :lastname, :email, :password_digest, :ec1, :ec1phone, :ec2, :ec2phone, :current_checkin_id, :username, :profile_picture, :phone], [
  ["Jacob", "Robinson", "jacob@example.com", "$2a$10$rcZXrZucDmkCzkHeynN6pOAV7TkH72PFadW.I5eJKsPaCJweGckPC", "Larry", "6041112222", "", "", nil, "jacob", "", "2505550155"],
  ["Simon", "Edmondson", "simon@example.com", "$2a$10$cTPab6w7VD4HoPnC0I5bdOVQdQ56V.puq5X11W/Ezx1txvjSfFOvu", "Larry", "6045555555", "", "", 5, "simon", "", "6044444444"],
  ["Harish", "Raisinghani", "harish@example.com", "$2a$10$FS5rOlZ5cOC72eKxIkS4sO2LGWfVkR4A9MJFVkCZRkmTsb5TeBe/C", "Larry", "6043333333", "", "", 6, "harish", "", "2505550157"],
  ["Silje", "Norendal", "silje@example.com", "$2a$10$li2i6.8QUJiwfL0NCgYzQuntZ2.hEMy2J.T7KHMc5xU6.OtQ4LcCi", "Larry", "6045555555", "", "", 7, "silje", "", "2505550158"],
  ["Bode", "Miller", "bode@example.com", "$2a$10$8AWbqsPAyaw0hektpoy6hOtAI8nisriUurMjqFToFdeMfkMHHyY3S", "Larry", "6045555555", "", "", 8, "bmiller", "", "2505550159"],
  ["Nancy", "Greene", "nancy@example.com", "$2a$10$pXF54wipa5VXKDtYP5sWDusmnZOwzEKEafFrckdQ6xurbAv6posnq", "Larry", "6045555555", "", "", nil, "nancy", "", "2505550160"]
])
