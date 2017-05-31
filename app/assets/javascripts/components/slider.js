App.ready(function(){

  // TOWER LIST CAROUSEL
  $(".tower-list__slider").slick({
    infinite: false,
    speed: 400,
    slidesToShow: 4,
    slidesToScroll: 1,
    variableWidth: true,
    nextArrow: '<div class="slick-arrow-next"></div>',
    prevArrow: '<div class="slick-arrow-prev"></div>'
  });

});
