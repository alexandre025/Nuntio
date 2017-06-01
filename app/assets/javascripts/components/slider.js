App.ready(function(){

  // TOWER LIST CAROUSEL
  $(".tower-list__slider").each(function(){
      var link = '.' + $(this).parents('.tower-list').find('.tower-list__slider-arrow').attr('class').split(" ")[0];

      var slider = $(this).sudoSlider({
        speed: 800,
        ease: 'swing',
        slideCount: 4,
        moveCount: 4,
        prevNext: false,
        customLink: link,
        initCallback:function(slide) {
          checkSlideForArrows(slider, slide, link);
        },
        beforeAnimation: function(slide){
          checkSlideForArrows(slider, slide, link);
        }
      });
  });

});

function checkSlideForArrows(slider, slide, link){

  // Hide/Show Prev Arrow
  if(slide > 1){
    $(link + '.arrow-prev').show();
  } else {
    $(link + '.arrow-prev').hide();
  }

  // Hide/Show Next Arrow
  if(slide >= slider.getValue('totalSlides') - 3){
    $(link + '.arrow-next').hide();
  } else {
    $(link + '.arrow-next').show();
  }

}
