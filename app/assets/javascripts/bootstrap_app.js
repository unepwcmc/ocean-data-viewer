$(function(){
  $('a[rel*=facebox]').facebox()
  $('#close_fb').click(function(){
    $(document).trigger('close.facebox');
    false;
  });
});

var map;

$(document).ready(function() {
  $("#slider").easySlider({
    auto: false,
    continuous: false
  });

  $('.tipsy').each(function(){
    $(this).tipsy()
  });

  $('div#down_databases_info a#showing_databases_down').children('span.tick').removeClass('up');
  $('div#down_databases_info a#showing_databases_down').children('span.tick').addClass('down');

  $('div#scrollable_databases').jScrollPane({scrollbarWidth:11});
  $('div#container').css('display','none');
  $('span#bottom_scrollable_databases').css('display','none');

  var options = {
    crs: L.CRS.EPSG4326,
    minZoom: 3,
    maxZoom: 18,
    zoom: 3,
    center: new L.latLng(0, 0),
    scrollWheelZoom: false,
    zoomControl: false
  };

  var southWest = L.latLng(-180, -3600),
    northEast = L.latLng(180, 3600),
    bounds = L.latLngBounds(southWest, northEast);

  map = new L.map('js_map', options);
  map.setMaxBounds(bounds);

  L.esri.basemapLayer("Topographic").addTo(map);

  if (typeof(loadWMS) == 'function'){
    loadWMS();
  }

  $('div#zoom_buttons a#zoomIn').click(function(ev) {
    ev.stopPropagation();
    ev.preventDefault();
    map.zoomIn();
  });

  $('div#zoom_buttons a#zoomOut').click(function(ev) {
    ev.stopPropagation();
    ev.preventDefault();
    map.zoomOut();
  });

  $('#resize_map').click(function(ev){
    ev.stopPropagation();
    ev.preventDefault();
    var map_height;
    var maximize = false;

    if ($(this).hasClass('reduce_map')) {
      $(this).removeClass('reduce_map');
      $('div.map').animate({height:'528px'}, 500,'','');
      $('div#map').animate({height:'400px'}, 500,'','');
      $('#layout_header').animate({height:'528px'}, 500,'','');
      $('div#zoom_buttons').fadeIn();
      $('div#down_databases_info').fadeIn();
                        $('#enlarge_map').fadeIn();
    } else {
      $(this).addClass('reduce_map');
      $('div.map').animate({height:'222px'}, 500,'','');
      $('div#map').animate({height:'222px'}, 500,'','');
      $('#layout_header').animate({height:'222px'}, 500,'','');
      $('div#zoom_buttons').fadeOut();
      $('div#down_databases_info').fadeOut();

      $('#enlarge_map').fadeOut();
    }

  });

  $('#enlarge_map').click(function(ev){
    ev.stopPropagation();
    ev.preventDefault();
    var map_height;
    var maximize = false;

    if ($(this).hasClass('reduce_map')) {
      $(this).removeClass('reduce_map');
      $('div.map').animate({height:'528px'}, 500,'','');
      $('div#map').animate({height:'400px'}, 500,'','');
      $('#layout_header').animate({height:'528px'}, 500,'','');
      $('#resize_map').fadeIn();
    } else {
      $(this).addClass('reduce_map');
      $('div.map').animate({height:'728px'}, 500,'','');
      $('div#map').animate({height:'600px'}, 500,'','');
      $('#layout_header').animate({height:'728px'}, 500,'','');
      $('#resize_map').fadeOut();
    }

  });

  $('li.title div.text a').hover(function(ev) {
    ev.stopPropagation();
    ev.preventDefault();

    $(this).parent().parent().children('div.head_shadow').css('display','inline');
    $(this).parent().parent().children('div.bottom_shadow').css('display','inline');
    },
    function(ev){
      $(this).parent().parent().children('div.head_shadow').css('display','none');
      $(this).parent().parent().children('div.bottom_shadow').css('display','none');
  });

  $('li.information ul li a').hover(function(ev) {
    ev.stopPropagation();
    ev.preventDefault();

    $(this).parent().children('div.left_shadow').css('display','inline');
    $(this).parent().children('div.right_shadow').css('display','inline');
    },
    function(ev){
      $(this).parent().children('div.left_shadow').css('display','none');
      $(this).parent().children('div.right_shadow').css('display','none');
  });

  // TOOLTIPS
  $('div.buttons a.download_dataset').hover(function(ev) {
    ev.stopPropagation();
    ev.preventDefault();

    $(this).children('div#download_tooltip').css('display','inline');
    },
    function(ev){
      $(this).children('div#download_tooltip').fadeOut('fast');
  });

  $('div.buttons a.download_factsheet').hover(function(ev) {
      ev.stopPropagation();
      ev.preventDefault();

      $(this).children('div#factsheet_tooltip').css('display','inline');
    },
    function(ev){
      $(this).children('div#factsheet_tooltip').fadeOut('fast');
  });

  $('div.buttons a.download_arcgis').hover(function(ev) {
    ev.stopPropagation();
    ev.preventDefault();

    $(this).children('div#arcgis_tooltip').css('display','inline');
    },
    function(ev){
      $(this).children('div#arcgis_tooltip').fadeOut('fast');
  });

  $('div#data_set_content_datasets ul.dataset li.information ul li a.button').click(function(ev){
    ev.stopPropagation();
    ev.preventDefault();

    if ($(this).hasClass('checked')){
      $(this).removeClass('checked');
      $(this).parent().children('div#info_tooltip').fadeOut('fast');
    }else{
      $(this).addClass('checked');
      $(this).parent().children('div#info_tooltip').css('display','inline');
    }
  });

  $('div#info_tooltip div.content span.head a.close').click(function(ev){
    ev.stopPropagation();
    ev.preventDefault();

    $(this).parent().parent().parent().parent().children('a').removeClass('checked');
    $(this).parent().parent().parent().fadeOut('fast');
  });

  // Down showing databases
  $('div#down_databases_info a#showing_databases_down').click(function(ev){
    ev.stopPropagation();
    ev.preventDefault();

    if ($(this).children('span.tick').hasClass('down')){
      $(this).children('span.tick').removeClass('down');
      $(this).children('span.tick').addClass('up');

      $(this).parent().children('div#container').css('display','inline');
      $(this).parent().children('span#bottom_scrollable_databases').css('display','inline');
    }
    else {
      $(this).children('span.tick').removeClass('up');
      $(this).children('span.tick').addClass('down');
      $(this).parent().children('div#container').fadeOut('fast');
      $(this).parent().children('span#bottom_scrollable_databases').fadeOut('fast');
    }
  });

  $('div#scrollable_databases ul li').click(function(ev){
    ev.stopPropagation();
    ev.preventDefault();

    if ($(this).hasClass('checked')){
      $(this).removeClass('checked');
    }
    else {
      $(this).addClass('checked');
    }
  });

  $('div#scrollable_databases ul li').hover(function(ev) {
    ev.stopPropagation();
    ev.preventDefault();

    $(this).children('p.text').addClass('hover');
    },
    function(ev){
      $(this).children('p.text').removeClass('hover');
  });

});
