App.ready(function(){

  $('.comments-container').each(function(){
    var self = this,
        form = $(this).find('.comments-container__form'),
        textarea = form.find('textarea');

    if(form.length){
      textarea.on('focusin', function(e){
        form.addClass('comment-open');
      });

      textarea.on('focusout', function(e){
        if(textarea.val().trim().length < 1){
          form.removeClass('comment-open');
        }
      });
    }
  });

});
