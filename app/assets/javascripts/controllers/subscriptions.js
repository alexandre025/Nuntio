// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

App.ready(function(){

  $('form').on('change', function(e) {
    data = $(this).serialize();

    $.ajax({
      url: App.routes.simulate_subscription_path+'?'+data,
      method: 'post'
    });
  });

});
