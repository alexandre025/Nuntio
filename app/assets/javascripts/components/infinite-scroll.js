App.ready(function(){

  $('.infinite-scroll-list').each(function(){

    $(this).jscroll({
      loadingHtml: '<div class="loader-container"><div class="loader"><svg viewBox="0 0 2 2"><circle id="circle" cx="1" cy="1" r="0.8" fill="none"></svg></div></div>',
      nextSelector: 'a.infinite-scroll:last',
      contentSelector: '.infinite-scroll-item',
      callback: setRatings
    });

  });

});
