App.ready(function(){

  $('.tabs-wrapper').each(function(){
    var parent = this;

    $(parent).on('click', '.nav-tabs span', function(e){
      e.stopPropagation();
      var tab_id = $(this).parent().attr('data-tab');

      $(parent).find('.tab-link').removeClass('active');
  		$(parent).find('.tab-pane').removeClass('active');

  		$(this).parent().addClass('active');
  		$(parent).find('#'+tab_id).addClass('active');
    });

  });

});
