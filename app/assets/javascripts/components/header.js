App.ready(function(){

  $('header').each(function(){

    var mainHeader = $('.cd-auto-hide-header');

    var scrolling = false,
        previousTop = 0,
        currentTop = 0,
        scrollDelta = 2,
        scrollOffset = 100;

    $(window).on('scroll', function(){
      if( !scrolling ) {
        scrolling = true;
        (!window.requestAnimationFrame)
          ? setTimeout(autoHideHeader, 250)
          : requestAnimationFrame(autoHideHeader);
      }
    });

    function autoHideHeader() {
        var currentTop = $(window).scrollTop();
        checkSimpleNavigation(currentTop);
        previousTop = currentTop;
        scrolling = false;
    }

    function checkSimpleNavigation(currentTop) {
        var exception_controllers = ['reports_show'];
        var body_id = $('body').attr('id');

  	    if (previousTop - currentTop > scrollDelta) {
          if(!exception_controllers.includes(body_id)){
  	    	    mainHeader.removeClass('is-hidden');
          } else{
            if(currentTop < scrollOffset){
              $('.header-behind').addClass('is-hidden');
              mainHeader.removeClass('is-hidden');
            }
          }
  	    } else if(currentTop - previousTop > scrollDelta && currentTop > scrollOffset) {
          $('.header-behind').removeClass('is-hidden');
          mainHeader.addClass('is-hidden');
  	    }
  	}

  });

});
