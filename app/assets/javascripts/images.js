$( document ).ready(function() {

  // hide spinner
  $(".sk-fading-circle").hide();


  // show spinner on AJAX start
  $(document).ajaxStart(function(){
    $(".sk-fading-circle").show();
  });

  // hide spinner on AJAX stop
  $(document).ajaxStop(function(){
    $(".sk-fading-circle").delay(30000).hide(0);
  });

});
