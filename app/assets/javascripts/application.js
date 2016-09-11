// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// // Dispatch:

// // on interval (short interval.. maybe 5 or 10 secs), have ping and alert data queried, 
// // update map and alert list accordingly.
// // AJAX GET

function getAlerts() { 
  $.ajax({
    method: 'GET',
    dataType: 'json',
    url: '/destinations/:id/alerts',
    success: function(data) {
      var alert_info = []
      var alert_lat_long = []
      var skier_names = []
      var master_info = []
      for (var i = 0; i < data[0].length; i ++) {
        var needed_alert_info = {
          // pin_label: ,
          false_alarm: data[0][i].false_alarm,
          state: data[0][i].state,
          patroller_id: data[0][i].patroller_id 
        }
        alert_info.push(needed_alert_info);
        var lat_long = {
          lat: data[1][i].lat,
          long: data[1][i].long
        }
        alert_lat_long.push(lat_long);
        var name = {
          skier_name: data[2][i]
        }
        skier_names.push(name);
      }
      for (var i = 0; i < alert_info.length; i ++) {
        master_info.push([skier_names[i], alert_lat_long[i], alert_info[i]]);
      }    
    console.log(master_info)
    }
  })
};

function getPings() { 
  $.ajax({
    method: 'GET',
    dataType: 'json',
    url: '/destinations/:id/pings',
    success: function(data) {
      var ping_lat_long = []
      for (var i = 0; i < data.length; i ++) {
        var ping_coords = {
          lat: data[i].lat,
          long: data[i].long
        }
        ping_lat_long.push(ping_coords);
      }
    console.log(ping_lat_long)
    }
  }); 
};

// // Patroller:

// // on button click, retrieve alert data linked to patrollers id and having alert status active, and populate the skier info and ping location on patroller view
// // AJAX GET

  // $('.patrollers-alerts-map').on('click', function() {
  //   $.ajax({
  //     method: 'GET',
  //     dataType: 'json',
  //     url: '/patrollers/1/alert',
  //     success: function(data) {
  //       console.log(data)
  //     }
  //   });
  // });


// // Skier:

// // on checkin (button click), if skier in group - display group name, group members, and populate map showing checked in group members latest ping
// // AJAX GET

// $('.checkin').on('click', function() {
//   $.ajax({
//     method: 'GET',
//     dataType: 'json',
//     url: '/groups/1/skiers/current_checkin/pings/last',
//     success: function(data) {
//       console.log(data)
//     }
//   })
// });


// // on button click, update map showing skier location of all logged in group members latest ping
// // AJAX GET

  // $('.update-group-map').on('click', function() {
  //   $.ajax({
  //     method: 'GET',
  //     dataType: 'json',
  //     url: '/groups/1/skiers/current_checkin/pings/last',
  //     success: function(data) {
  //       console.log(data)
  //     }
  //   })
  // });

// // on interval (starting from checkin time), have skiers phone pinged, and save that data to the ping table
// // AJAX POST

// $('.checkin_ping').on('click', function() {
//   var cell_ping = {
//     // DONT FORGET TO UPDATE WITH GEOLOCATOR VARIABLES
//     lat: 77.0,
//     long: 67.0,
//     // Skier.find(session[:id]).current_checkin_id
//     checkin_id: 10 
//   }  
//   $.ajax({
//     method: 'POST',
//     dataType: 'json',
//     data: {
//       ping: cell_ping
//     },
//     url: '/pings',
//     success: function(ping) {
//       console.log(ping)
//     },
//     error: function(e){
//       console.log(e)
//     }
//   })
// });

// // on checkin, create checkin object linked to skier
// // AJAX POST

// $('.new_checkin').on('click', function() { 
//   var new_checkin = {
//     destination_id: 4,
//     skier_id: 2, 
//   }
//   $.ajax({
//     method: 'POST',
//     dataType: 'json',
//     data: {
//       checkin: new_checkin
//     },
//     url: '/checkins',
//     success: function(checkin) {
//       console.log(checkin)
//     }
//   })
// });

// // on button click, new group and memberships are created
// // AJAX POST

// $('.new_group').on('click', function() { 
//   var new_group = {
//     admin_id: 1,
//     name: 'KBM', 
//   }
//   $.ajax({
//     method: 'POST',
//     dataType: 'json',
//     data: {
//       group: new_group
//     },
//     url: '/groups',
//     success: function(new_group) {
//       console.log(new_group)
//     }
//   })
// });

// $('.new_membership').on('click', function() { 
//   var new_membership = {
//     group_id: 1,
//     skier_id: 2, 
//   }
//   $.ajax({
//     method: 'POST',
//     dataType: 'json',
//     data: {
//       membership: new_membership
//     },
//     url: '/memberships',
//     success: function(new_membership) {
//       console.log(new_membership)
//     }
//   })
// });

// GROUP VIEW:

// // on button click delete group
// // AJAX DELETE

// $('.test-button').on('click', function() {
//   var group_to_delete = {
//     name: 'KBM',
//     admin_id: 1
//   }
//     $.ajax({
//       method: 'DELETE',
//       dataType: 'json',
//       data: {
//         group: group_to_delete
//       },
//       url: '/groups/1',
//       success: function(data) {
//         console.log(data)
//       }
//     })
//   });

// // on button click, delete skier id from group (multiple buttons with same ID)
// // AJAX DELETE

// $('.delete_memebership').on('click', function() {
//   var membership_to_delete = {
//     ACTIVE RECORD QUERY HERE
//   }
//     $.ajax({
//       method: 'DELETE',
//       dataType: 'json',
//       data: {
//         skier: membership_to_delete
//       },
//       url: '/memberships/1',
//       success: function(data) {
//         console.log(data)
//       }
//     })
//   });

// // on button click, send email to skier with link allowing them to join group
// // AJAX ??? USE PONY GEM


// // on button click, have alert table updated to include patroller id#
// // AJAX UPDATE

// $('.update-patroller-id-on-alert-object').on('click', function() { 
//   var patroller_id_to_add = {
//     patroller_id: 3
//   }
//   $.ajax({
//     method: 'PUT',
//     dataType: 'json',
//     data: {
//       alert: patroller_id_to_add
//     },
//     url: '/alerts/3',
//     success: function(add_patroller_id) {
//       console.log(add_patroller_id)
//     }
//   })
// });

// // on button click, have alert table updated to have closed status / false alarm status
// // AJAX UPDATE

// $('.update-alert-state').on('click', function() { 
//   var alarm = {
//     false_alarm: true,
//     state: 'closed'
//   }
//   $.ajax({
//     method: 'PUT',
//     dataType: 'json',
//     data: {
//       alert: alarm
//     },
//     url: '/alerts/3',
//     success: function(data) {
//       console.log(data)
//     }
//   })
// });
