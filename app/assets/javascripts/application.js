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
//= require jquery/dist/jquery
//= require angular/angular
//= require angularjs-rails-resource/angularjs-rails-resource
//= require leaflet/dist/leaflet
//= require esri-leaflet/dist/esri-leaflet
//= require spectrum/spectrum
//= require jquery.mousewheel
//= require jquery.jscrollpane
//= require jquery.textshadow
//= require jquery.tipsy
//= require tipsy
//= require dataset-list
//= require map
//= require angular/directives/map
//= require angular/directives/multi-selector
//= require angular/directives/click-anywhere-but-here
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
