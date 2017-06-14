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
      parentRight = parent.offset().left + parent.width(),
      activeItem;

  $(elem).find('.tower-main-link').each(function(){
      var item = $(this),
          itemMoreCategories = parent.find('.more-categories');

      if((item.offset().left + item.width()) > (parentRight - itemMoreCategories.width() - 12)) {
          item.appendTo(parent.find('.more-categories ul'));
          itemMoreCategories.css('display', 'inline-block');
      }

      if(item.hasClass('active')){
        activeItem = item;
      }
  });

  if(activeItem !== undefined && activeItem.parent('.header-bottombar__submenu').length){
      checkActiveItemInSubmenu(parent, activeItem);
  }

}

function checkActiveItemInSubmenu(parent, item){
  item.appendTo(parent);
  item.insertAfter('.current-theme');

  var lastItem = $('.header-bottombar__towers--category > .tower-main-link:last');
  var submenu = parent.find('.more-categories .header-bottombar__submenu');
  lastItem.prependTo(submenu);
}
