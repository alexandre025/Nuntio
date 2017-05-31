App.ready(function(){

  // TOWER LIST CAROUSEL
  $(".tower-list__slider").each(function(){
    if(!$(this).hasClass('slick-initialized')){
      $(this).slick({
        infinite: false,
        speed: 400,
        slidesToShow: 4,
        slidesToScroll: 1,
        variableWidth: true,
        nextArrow: '<div class="slick-arrow-next"></div>',
        prevArrow: '<div class="slick-arrow-prev"></div>'
      });
    }
  });

});
