$(function () {
  $('div#scrollable_databases').jScrollPane({
    autoReinitialise: true,
    verticalGutter: 0
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
