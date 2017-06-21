// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

App.ready(function(){

  $('.tower-show__content--side').each(function(){
    var values = {
      defaultTop: -61,
      defaultRight: -125,
      fixedTop: 146
    };

    var self = this,
        selfLimit = $(self).offset().top - values.fixedTop;

    setSidePosition(self, selfLimit, values);

    $(window).bind('scroll', function() {
      if($('#towers_show').is('*')) {
        setSidePosition(self, selfLimit, values);
      }
    });

  });

  $('.preview-open').on('click', function(){
    $('.tower-preview').css('display', 'block');
    setTimeout(function() {
      $('.tower-preview').addClass('preview-show');
      $('body').addClass('disable-scroll');
    }, 300);
  });

  $('.preview-close').on('click', function(){
    $('.tower-preview').removeClass('preview-show');
    $('body').removeClass('disable-scroll');
    setTimeout(function() {
      $('.tower-preview').css('display', 'none');
    }, 300);
  });


});

function setSidePosition(self, selfLimit, values){
  var currentSelfPosition = $(self).offset(),
      divLimit = $('body').find('.tower-show__others'),
      scrollLimit = divLimit.offset().top - $(self).height() + values.defaultTop - values.fixedTop;

  if($(window).scrollTop() >= selfLimit) {
    if($(window).scrollTop() <= scrollLimit){
      $(self).css({
        'position': 'fixed',
        'top': values.fixedTop,
        'bottom': 'inherit',
        'left': currentSelfPosition.left,
        'right': 'inherit'
      });
    } else{
      $(self).css({
        'position': 'absolute',
        'top': 'inherit',
        'bottom': 0,
        'left': 'inherit',
        'right': values.defaultRight
      });
    }
  } else{
    $(self).css({
      'position': 'absolute',
      'top': values.defaultTop,
      'bottom': 'inherit',
      'left': 'inherit',
      'right': values.defaultRight
    });
  }
}
