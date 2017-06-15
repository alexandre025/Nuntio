App.ready(function(){

  $('.field-checkbox').each(function(){
    getCheckboxes(this);
  });

});

function getCheckboxes(elem){
  var parent = $(elem),
      input = $(elem).find('input[type="checkbox"]'),
      label = $(elem).find('label');

  label.on('click', function(){
    setCheckboxIfError(parent, input, label);
  });
}

function setCheckboxIfError(parent, input, label){
  if(parent.find('.field_with_errors').length > 0){
    if(input.prop('checked')){
      parent.removeClass('active-checkbox');
    } else{
      parent.addClass('active-checkbox');
    }
  } else{
    parent.removeClass('active-checkbox');
  }
}
