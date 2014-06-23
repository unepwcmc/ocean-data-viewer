$(function () {
  $('div#scrollable_databases').jScrollPane({
    scrollbarWidth: 11,
    autoReinitialise: true
  });

  $('div#scrollable_databases ul li').click(function(ev){
    ev.stopPropagation();
    ev.preventDefault();

    if ($(this).hasClass('active')){
      $(this).removeClass('active');
    }
    else {
      $(this).addClass('active');
    }
  });
});
