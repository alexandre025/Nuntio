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
        selfLimit = $(self).offset().top - values.fixedTop,
        divLimit = $('body').find('.tower-show__others'),
        scrollLimit = divLimit.offset().top - $(self).height() + values.defaultTop - values.fixedTop; //$(self).offset().top - 93 + divLimit.scrollTop() + divLimit.height()

    setSidePosition(self, selfLimit, scrollLimit, values);

    $(window).scroll(function() {
      setSidePosition(self, selfLimit, scrollLimit, values);
    });
  });

});

function setSidePosition(self, selfLimit, scrollLimit, values){
  var currentSelfPosition = $(self).offset();

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
