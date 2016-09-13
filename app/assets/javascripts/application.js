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
      console.log(data)
      var alertInfo = []
      var alertLatLong = []
      var skierNamesAndIDs = []
      var masterInfo = []
      for (var i = 0; i < data[0].length; i ++) {
        var neededAlertInfo = {
          skier_id: data[3][i],
          false_alarm: data[0][i].false_alarm,
          state: data[0][i].state,
          patroller_id: data[0][i].patroller_id 
        }
        alertInfo.push(neededAlertInfo);
        var latLong = {
          lat: data[1][i].lat,
          long: data[1][i].long
        }
        alertLatLong.push(latLong);
        var nameAndID = {
          skier_name: data[2][i]
        }
        skierNamesAndIDs.push(nameAndID);
      }
      for (var i = 0; i < alertInfo.length; i ++) {
        masterInfo.push([skierNamesAndIDs[i], alertLatLong[i], alertInfo[i]]);
      } 
      console.log(masterInfo);
      updateDispatchAlertPins(masterInfo);
      updatePageAlertInfo(masterInfo);  
    }
  })
};

function updatePageAlertInfo(masterInfo) {
  // var newRow = $('<tr>');
  for (var i = 0; i < masterInfo.length; i++) {
    $('#alert-body').append('<tr><td>' + masterInfo[i][2].skier_id + '</td><td><a href=/skiers/' + masterInfo[i][2].skier_id + '>' + masterInfo[i][0].skier_name + '</a></td><td><input class="form-check-input" type="checkbox" value=""></td><td>' + masterInfo[i][2].state + '</td><td><button onclick="myFunction()"' + 
      'class="dropbtn">Assign Patroller ID</button></td><td><button class="btn btn-danger">Send to Patroller</button></td></tr>');
    // $('<td>')
    //   .text(masterInfo[i][2].pin_label)
    //   .appendTo(newRow),
    // $('<td>') 
    //   .text(masterInfo[i][0].skier_name)
    //   .appendTo(newRow),
    // $('<td>')
      //TODO checkbox
    // $('<td>')
    //   .text(masterInfo[0][2].state)
    //   .appendTo(newRow),
    // $('<td>')
      //TODO dropdown
    // $('<td>')
      //TODO button
  }
  // $(newRow).appendTo('#alert-body');
  // console.log(newRow)
}

function getPings() { 
  $.ajax({
    method: 'GET',
    dataType: 'json',
    url: '/destinations/:id/pings',
    success: function(data) {
      var pingLatLong = []
      for (var i = 0; i < data.length; i ++) {
        var pingCoords = {
          lat: data[i].lat,
          long: data[i].long
        }
        pingLatLong.push(pingCoords);
      }
      updateDispatchSkierPins(pingLatLong);
    // console.log(pingLatLong)
    // TODO create map and populate lat long data

    }
  }); 
};
var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';

function updateDispatchAlertPins(masterInfo) {
  masterInfo.forEach(function(record) {
    var contentString = record[0].skier_name;
    var alertCoord = {lat: record[1].lat, lng: record[1].long};
    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });
    var myMarker = new google.maps.Marker({
      position: alertCoord,
      map: SkiPals.map,
      animation: google.maps.Animation.DROP,
      icon: iconBase + 'caution.png'
    });
    myMarker.addListener('click', function() {
      infowindow.open(SkiPals.map, myMarker);
    });
  })
}

function updateDispatchSkierPins(pingLatLong) {
  for (var i = 0; i < pingLatLong.length; i ++) {
    var skierCoord = {lat: pingLatLong[i].lat, lng: pingLatLong[i].long};
    var myMarker = new google.maps.Marker({
      position: skierCoord,
      map: SkiPals.map,
      animation: google.maps.Animation.DROP,
      icon: iconBase + 'ski.png'
    });
  }
}


// // Patroller:

// // on button click, retrieve alert data linked to patrollers id and having alert status active, and populate the skier info and ping location on patroller view
// // AJAX GET

  // $('.patrollers-alerts-map').on('click', function() {
  //   $.ajax({
  //     method: 'GET',
  //     dataType: 'json',
  //     url: '/patrollers/:id/alert',
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
//     url: '/groups/:id/skiers/current_checkin/pings/last',
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
  //     url: '/groups/:id/skiers/current_checkin/pings/last',
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
//     // Skier.find_by(session[:id]).current_checkin_id
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
