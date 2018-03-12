//$(document).ready(function() {
  //$('#draggable').draggable();
//});

$('mbl-menu-button').on('click', function(){
  $(this).toggleClass('slide');
  $('reveal').toggleClass('scaled');
  $('.content').toggleClass('fade');
});