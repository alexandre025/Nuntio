App.ready(function(){

    $('#modal-receiver').on('modal:load', function (e, data) {
        console.log('Event fired : modal:load');
        $receiver = $(this);
        $receiver.find('.modal').hide();
        $receiver.html(data);
        setModalPosition($receiver.find('.modal'));
        $receiver.find('.modal').show();

        $('body').addClass('disable-scroll');
        $('.field-checkbox').each(function(){
          getCheckboxes(this);
        });

        $form = $receiver.find('form');

        $form.on('ajax:success', function (e, data) {
            $('#modal-receiver').trigger('modal:load', data);
        });

    });

    $('[data-modal=load]').each(function(e, elem){
        $(document).trigger('modal:init', elem);
    });

    $(document).on('click', '.modal-close', function(e){
      $('#modal-receiver').find('.modal').hide();
      $('#modal-receiver').html('');
      $('body').removeClass('disable-scroll');
    });

    $(document).on('click', '.modal', function(e){
      if(e.target !== e.currentTarget) return;

      $('#modal-receiver').find('.modal').hide();
      $('#modal-receiver').html('');
      $('body').removeClass('disable-scroll');
    });

});

// Init ajax:success listener
$(document).on('modal:init', function(e, elem) {
    console.log('Event fired : modal:init');
    $(elem).on('ajax:success', function (e, data, status) {
      console.log('Event fired : ajax:success');
      $('#modal-receiver').trigger('modal:load', data, status);
    });
});

function setModalPosition(modal){
  var modalContainer = modal.find('.modal-container');
  if(modalContainer.height() > $(window).height() - 120){
    modalContainer.addClass('high-modal');
  } else{
    modalContainer.removeClass('high-modal');
  }
}
