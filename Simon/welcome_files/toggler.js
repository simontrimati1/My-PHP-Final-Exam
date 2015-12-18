$(document).ready( function(){
  var $form = $(document).find('form.booking');
  $form.find('input').focus(function(){
      $(this).attr('placeholder', '');
  });
    $form.find('input').blur(function(){
      $(this).attr('placeholder', $(this).attr('alt'));
  });
});