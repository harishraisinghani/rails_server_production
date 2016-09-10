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