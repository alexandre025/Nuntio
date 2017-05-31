App.ready(function(){

  $('.header-bottombar__towers--category').each(function(){
    var self = this;
    moveExtraMenuItems(self);

    window.addEventListener('resize', function(e){
      moveExtraMenuItems(self);
    });

  });

});

function moveExtraMenuItems(elem){
  var parent      = $(elem),
      parentRight = parent.offset().left + parent.width();

  $(elem).find('.tower-main-link').each(function(){
      var item = $(this),
          itemMoreCategories = parent.find('.more-categories');

      if((item.offset().left + item.width()) > (parentRight - itemMoreCategories.width() - 12)) {
          item.prependTo(parent.find('.more-categories ul'));
          itemMoreCategories.css('display', 'inline-block');
      }
  });

}
