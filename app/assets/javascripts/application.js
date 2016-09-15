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

var alertMarkers = {};
var skierMarkers = {};

function getAlerts() { 
  $.ajax({
    method: 'GET',
    dataType: 'json',
    url: 'https://skipatrolproductiondatabase.herokuapp.com/destinations/:id/alerts',
    success: function(data) {
      var masterInfo = []
      var onShiftPatrollers = []
      for (var i = 0; i < data[0].length; i++) {
        var niceData = {
          skier_id: data[3][i],
          false_alarm: data[0][i].false_alarm,
          state: data[0][i].state, 
          lat: data[1][i].lat,
          long: data[1][i].long,
          skier_name: data[2][i],
          alert_id: data[0][i].id
        }
        masterInfo.push(niceData);
      }
      for (var i = 0; i < data[4].length; i++) {
        var patrollerInfo = {
          name: data[4][i].lastname,
          id: data[4][i].id
        }
        onShiftPatrollers.push(patrollerInfo);
      }
      updateDispatchAlertPins(masterInfo);
      updatePageAlertInfo(masterInfo, onShiftPatrollers);  
    }
  })
};

function updatePageAlertInfo(masterInfo, onShiftPatrollers) {
  $('#alert-body').html("");
  var alertInfoTemplateSource = $('#alert-template').html();
  var alertInfoTemplate = Handlebars.compile(alertInfoTemplateSource);
  var patrollerInfoTemplateSource = $('#patroller-template').html();
  var patrollerInfoTemplate = Handlebars.compile(patrollerInfoTemplateSource);
  var alertId;

  for (var i = 0; i < masterInfo.length; i++) {
    alertId = masterInfo[i].alert_id;

    var alertInfo = {
      skier_name: masterInfo[i].skier_name, 
      skier_id: masterInfo[i].skier_id,
      alert_state: masterInfo[i].state,
      // patroller_id: masterInfo[i].patroller_id,
      alert_id: alertId
    };
    var alertInfoHtml = alertInfoTemplate(alertInfo);
    $('#alert-body').append(alertInfoHtml);

    for (var p = 0; p < onShiftPatrollers.length; p++) {
      var patrollers = {
        alert_id: alertId,
        patroller_name: onShiftPatrollers[p].name,
        patroller_id: onShiftPatrollers[p].id
      };
      var patrollerInfoHtml = patrollerInfoTemplate(patrollers);
      $('#assignment-list-' + alertId).append(patrollerInfoHtml);
    }   
  };
  addPatrollerIdHandler()
  addFalseAlarmClickHandler();
  addResolvedClickHandler();
}

function getPings() { 
  $.ajax({
    method: 'GET',
    dataType: 'json',
    url: 'https://skipatrolproductiondatabase.herokuapp.com/destinations/:id/pings',
    success: function(data) {
      console.log(data)
      var pingLatLong = []
      for (var i = 0; i < data[0].length; i++) {
        var pingCoords = {
          lat: data[0][i].lat,
          long: data[0][i].long,
          skier_id: data[1][i]
        }
        pingLatLong.push(pingCoords);
      }
      updateDispatchSkierPins(pingLatLong);
    }
  }); 
};
var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';

function updateDispatchAlertPins(masterInfo) {

  if (alertMarkers) {
    for (var key in alertMarkers) {
      alertMarkers[key].setMap(null);
    }
  alertMarkers = {};
  }; 

  masterInfo.forEach(function(record) {
    var contentString = record.skier_name;
    var alertCoord = {lat: record.lat, lng: record.long};
    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });
    var myMarker = new google.maps.Marker({
      position: alertCoord,
      map: SkiPals.map,
      icon: iconBase + 'caution.png'
    });
    myMarker.alert_id = record.alert_id;
    alertMarkers[record.alert_id] = myMarker;
    myMarker.addListener('click', function() {
      infowindow.open(SkiPals.map, myMarker);
    });
  });
}

function updateDispatchSkierPins(pingLatLong) {
  if (skierMarkers) {
    for (var key in skierMarkers) {
      skierMarkers[key].setMap(null);
    }
  skierMarkers = {};
  }; 

  for (var i = 0; i < pingLatLong.length; i++) {
    var skierCoord = {lat: pingLatLong[i].lat, lng: pingLatLong[i].long};    

    console.log("New Skiier pin");
    var myMarker = new google.maps.Marker({
      position: skierCoord,
      map: SkiPals.map,
      icon: iconBase + 'capital_big.png'
    });
    myMarker.skier_id = pingLatLong.skier_id;
    skierMarkers[pingLatLong.skier_id] = myMarker;
  }
}

// on button click, update false alarm to be true, and state to closed, and remove from alert page
// UPDATE
function addFalseAlarmClickHandler() {
  $('.false-alarm-close').on('click', function() {
    var alert_id = this.dataset.alertId;
    var alarm = {
      false_alarm: true,
      state: 'inactive'
    };
    $.ajax({
      method: 'PUT',
      dataType: 'json',
      data: {
        alert: alarm
      },
      url: 'https://skipatrolproductiondatabase.herokuapp.com/alerts/' + alert_id,
      success: function(data) {
        getAlerts();
        console.log("false alarm success")
      }
    })
  });
}

// on button click, update alert patroller id and show resolved button
// UPDATE
function addPatrollerIdHandler() {
  $('.patroller-assignment').on('click', function() { 
    var alert_id = this.dataset.alertId;
    var patroller_id = {
      patroller_id: this.dataset.patrollerId
    }
    console.log('assign ' + this.dataset.patrollerId + ' to ' + alert_id);
    $.ajax({
      method: 'PUT',
      dataType: 'json',
      data: {
        alert: patroller_id
      },
      url: 'https://skipatrolproductiondatabase.herokuapp.com/alerts/' + alert_id,
      success: function() {
        console.log("assign patroller success")
        getAlerts()
      }
    })
  });
}
// on button click, update status to closed and remove from alert page
// UPDATE
function addResolvedClickHandler() {
  $('.resolved-closed').on('click', function() { 
    var alert_id = this.dataset.alertId;
    var status = {
      state: 'inactive'
    }
    $.ajax({
      method: 'PUT',
      dataType: 'json',
      data: {
        alert: status
      },
      url: 'https://skipatrolproductiondatabase.herokuapp.com/alerts/' + alert_id,
      success: function(data) {
        console.log(data)
        getAlerts();
        //
        // deleteMarker(alert_id);
      }
    })
  });
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



// // on button click, have alert table updated to have closed status / false alarm status
// // AJAX UPDATE


