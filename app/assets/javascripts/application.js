// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require ../../../vendor/assets/bower_components/jquery/dist/jquery
//= require ../../../vendor/assets/bower_components/angular/angular
//= require ../../../vendor/assets/bower_components/angularjs-rails-resource/angularjs-rails-resource
//= require ../../../vendor/assets/bower_components/leaflet/dist/leaflet
//= require ../../../vendor/assets/bower_components/esri-leaflet/dist/esri-leaflet
//= require jquery.mousewheel
//= require jquery.jscrollpane
//= require jquery.textshadow
//= require jquery.tipsy
//= require tipsy
//= require dataset-list
//= require map
//= require angular/directives/map
//= require angular/directives/multi-selector
//= require angular/resources/map_search
//= require angular/controllers/map_controller

// needs transform the :key's to an array keeping only then ones which the :value is true
function selectedValues(obj) {
  var keysWithTrueValue = [];
  for (var key in obj) {
    if (obj[key]) {
      keysWithTrueValue.push(key);
    }
  }
  return keysWithTrueValue;
}
