App.ready(function(){

  $('.ransack-number input').each(function(){
    var timeout = null,
        input = this,
        form = $(this).parents('form');

    $(input).keyup(function(){
      clearTimeout(timeout);

      timeout = setTimeout(function () {
          form.submit();
      }, 800);
    });
  });

});
