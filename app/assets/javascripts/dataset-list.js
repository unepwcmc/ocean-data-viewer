$(function () {
  $('div#scrollable_databases').jScrollPane({
    autoReinitialise: true,
    verticalGutter: 0
  });

  $('div#scrollable_databases ul li').click(function(ev){
    if ($(this).hasClass('active')){
      $(this).removeClass('active');
    }
    else {
      $(this).addClass('active');
    }
  });

  $('.arrow-more').click(function(e) {
    e.preventDefault();
    e.stopPropagation();
    $(this).closest('li').find('.additional-info').slideDown(200);
    $(this).closest('li').find('.arrow-more').hide();
    $(this).closest('li').find('.arrow-less').show();
  });

  $('.arrow-less').click(function(e) {
    e.preventDefault();
    e.stopPropagation();
    $(this).closest('li').find('.additional-info').slideUp(200);
    $(this).closest('li').find('.arrow-less').hide();
    $(this).closest('li').find('.arrow-more').removeAttr('style');
    $(this).closest('li').find('.arrow-less').removeAttr('style');
  });
});
