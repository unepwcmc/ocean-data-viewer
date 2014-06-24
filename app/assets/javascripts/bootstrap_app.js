$(document).ready(function() {
  $('.tipsy').each(function(){
    $(this).tipsy()
  });

  $('li.title div.text a').hover(function(ev) {
    ev.stopPropagation();
    ev.preventDefault();
  });

  $('li.information ul li a').hover(function(ev) {
    ev.stopPropagation();
    ev.preventDefault();
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
});
