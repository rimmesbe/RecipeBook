$( document ).ready(function() {
  // create recipe button
  $('#create-btn').on("click", function(e){
    $('div').animate({right: '2000px'}, "slow");
  });
  // hope page button
  $('.navbar-header').on("click", function(e){
    $('div').animate({left: '2000px'}, "slow");
  });
  // home page list links
  $('.homepage-lists').on("click", function(e){
    $('div').animate({right: '2000px'}, "slow");
  });
  // user page list links
  $('.user-lists').on("click", function(e){
    $('div').animate({right: '2000px'}, "slow");
  });
});