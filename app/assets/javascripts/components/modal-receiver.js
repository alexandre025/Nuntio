App.ready(function(){

    $('#modal-receiver').on('modal:load', function (e, data) {
        console.log('Event fired : modal:load');
        $receiver = $(this);
        $receiver.find('.modal').hide();
        $receiver.html(data);
        $receiver.find('.modal').show();

        $form = $receiver.find('form');

        $form.on('ajax:success', function (e, data) {
            $('#modal-receiver').trigger('modal:load', data);
        });

    });

    $('[data-modal=load]').each(function(e, elem){
        $(document).trigger('modal:init', elem);
    });

    // $('#modal-receiver .modal-close').on('click', function(e){
    //   console.log('close');
    //   $('#modal-receiver').find('.modal').hide();
    //   $('#modal-receiver').html('');
    // });

});

// Init ajax:success listener
$(document).on('modal:init', function(e, elem) {
    console.log('Event fired : modal:init');
    $(elem).on('ajax:success', function (e, data, status) {
      console.log('Event fired : ajax:success');
      $('#modal-receiver').trigger('modal:load', data, status);
    });
});
