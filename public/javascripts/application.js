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
	
        /* VIZZ GMAPS
	var myOptions = {
	        zoom: 8,
	        center: new google.maps.LatLng(28.685769,-14.540405),
	        disableDefaultUI: true,
	        scrollwheel:false,
	        mapTypeId: google.maps.MapTypeId.TERRAIN
	    };
	    map = new google.maps.Map(document.getElementById("js_map"), myOptions);
       */

        bounds = new OpenLayers.Bounds(-19037508.34, -14037508.34,
                                      10937508.34, 14037508.34);

        var options = {
                projection: new OpenLayers.Projection("EPSG:900913"),
                displayProjection: new OpenLayers.Projection("EPSG:4326"),
                units: "m",
                numZoomLevels: 18,
                maxResolution: 156543.0339,
	        scrollwheel:false,
                controls: [],
                maxExtent: new OpenLayers.Bounds(-20037508, -20037508,
                                                 20037508, 20037508.34)
          
                };
        
        map = new OpenLayers.Map('js_map', options);
        
        var customControls = [new OpenLayers.Control.DragPan()
                              ];
        for (var i=0; i<customControls.length; i++) {
          var control = customControls[i];
          map.addControl(control);
          control.activate();
        }
        

        // create Google Mercator layers
        var satellite = new OpenLayers.Layer.Google(
            "Google Streets",
            {
              sphericalMercator: true,
              scrollwheel:false,
              type: google.maps.MapTypeId.TERRAIN
            }
        );
        map.addLayers([satellite])

        // Hack required to get set centre working
        var myzoom = 2; 
        var lonCenter = 10; 
        var latCenter = 25; 

        point = new OpenLayers.Geometry.Point(lonCenter, latCenter); 
        OpenLayers.Projection.transform(point, map.displayProjection, map.getProjectionObject()); 
        map.setCenter(new OpenLayers.LonLat(point.x, point.y), myzoom);



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
		} else {
			$(this).addClass('reduce_map');			
			$('div.map').animate({height:'222px'}, 500,'','');
			$('div#map').animate({height:'222px'}, 500,'','');			
			$('#layout_header').animate({height:'222px'}, 500,'','');
			$('div#zoom_buttons').fadeOut();
			$('div#down_databases_info').fadeOut();			
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
	
        loadWMS();
});
