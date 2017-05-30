App.ready(function(){

    $('#modal-receiver').on('modal:load', function (e, data) {
        console.log('Event fired : modal:load');
        $receiver = $(this);
        $receiver.find('.modal').modal('hide');
        $receiver.html(data);
        $receiver.find('.modal').modal('show');

        $form = $receiver.find('form');

        $form.on('ajax:success', function (e, data) {
            $('#modal-receiver').trigger('modal:load', data);
        });

    });

    $('[data-modal=load]').each(function(e, elem){
        $(document).trigger('modal:init', elem);
    });

});

// Init ajax:success listener
$(document).on('modal:init', function(e, elem) {
    console.log('Event fired : modal:init');
    $(elem).on('ajax:success', function (e, data) {
        console.log('Event fired : ajax:success');
        $('#modal-receiver').trigger('modal:load', data);
    });
});
