App.ready(function(){

  $('.container').each(function(){
    var headerHeight = $('header').height();
    $(this).css('padding-top', headerHeight);
  });

});
