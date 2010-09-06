var map;

$(document).ready(function() {
	
	$('ul#list').jScrollPane({scrollbarWidth:11});
	
	$('div#down_databases_info a#showing_databases_down').children('span.tick').removeClass('up');
	$('div#down_databases_info a#showing_databases_down').children('span.tick').addClass('down');
	$('div#scrollable_databases').css('display','none');	
	$('div#scrollable_databases').parent().children('span#bottom_scrollable_databases').css('display','none');
	
	var myOptions = {
	        zoom: 8,
	        center: new google.maps.LatLng(28.685769,-14.540405),
	        disableDefaultUI: true,
	        scrollwheel:false,
	        mapTypeId: google.maps.MapTypeId.TERRAIN
	    };
	    map = new google.maps.Map(document.getElementById("js_map"), myOptions);

	$('div#zoom_buttons a#zoomIn').click(function(ev) {
		ev.stopPropagation();
		ev.preventDefault();
		map.setZoom(map.getZoom()+1);
	});
	
	$('div#zoom_buttons a#zoomOut').click(function(ev) {
		ev.stopPropagation();
		ev.preventDefault();
		map.setZoom(map.getZoom()-1);
	});
	
	$('#resize_map').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();
		var map_height;
		var maximize = false;
		
		if ($(this).hasClass('reduce_map')) {
			$(this).removeClass('reduce_map');
			$('div.map').animate({height:'528px'}, 500,'','');
			$('#layout_header').animate({height:'528px'}, 500,'','');			
			$('div#zoom_buttons').fadeIn();
			$('div#down_databases_info').fadeIn();
		}else {
			$(this).addClass('reduce_map');			
			$('div.map').animate({height:'222px'}, 500,'','');
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
	
	$('li.information ul li a').click(function(ev){

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
			$(this).parent().children('div#scrollable_databases').css('display','inline');
			$(this).parent().children('span#bottom_scrollable_databases').css('display','inline');
		}
		else {
			
			$(this).children('span.tick').removeClass('up');
			$(this).children('span.tick').addClass('down');
			$(this).parent().children('div#scrollable_databases').fadeOut('fast');
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
	
	$('div#footer_supportsites div.content_right a.right').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();
		$(this).css('display','none');
		$(this).parent().children('a.left').css('display','inline');
		$('div#footer_supportsites div.content_right ul').animate({margin:'-202px 0 0 0'}, 0,'','');

	});

	$('div#footer_supportsites div.content_right a.left').click(function(ev){
		ev.stopPropagation();
		ev.preventDefault();
		$(this).css('display','none');
		$(this).parent().children('a.right').css('display','inline');	
		$('div#footer_supportsites div.content_right ul').animate({margin:'0 0 0 0'}, 0,'','');

	});

});
