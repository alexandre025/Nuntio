// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

App.ready(function(){

  $('.tower-show__content--side').each(function(){
    var self = this,
        selfLimit = $(self).offset().top - 146,
        divLimit = $('body').find('.tower-show__others'),
        scrollLimit = $(self).offset().top - 93 + divLimit.scrollTop() + divLimit.height();

    setSidePosition(self, selfLimit, scrollLimit);

    $(window).scroll(function() {
      setSidePosition(self, selfLimit, scrollLimit);
    });
  });

});

function setSidePosition(self, selfLimit, scrollLimit){
  var selfPosition = $(self).offset();

  if($(window).scrollTop() >= selfLimit) {
    if($(window).scrollTop() <= scrollLimit){
      $(self).css({
        'position': 'fixed',
        'top': 146,
        'bottom': 'inherit',
        'left': selfPosition.left,
        'right': 'inherit'
      });
    } else{
      $(self).css({
        'position': 'absolute',
        'top': 'inherit',
        'bottom': 0,
        'left': 'inherit',
        'right': '-125px'
      });
    }
  } else{
    $(self).css({
      'position': 'absolute',
      'top': -61,
      'bottom': 'inherit',
      'left': 'inherit',
      'right': '-125px'
    });
  }
}
