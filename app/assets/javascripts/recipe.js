function add_fields(link, association, content){
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

$( document ).ready(function() {
    // filters ingredient options
    // added option to selector to pinpoint option tags
    ingredient_selection = $('.select-ingredient option');
    $('.actions').delegate(".select-type", "change", function() {
      f_type = $('.select-type :selected').text();

      options = ingredient_selection.filter(function() {
        // filters by f_type
        return this.dataset.foodType === f_type;
      });
      $('.select-ingredient').html(options);

      $('.select-type').val('1');

    });

  // dynamically adds ingredient fields for new recipe
  $('#add_recipe').on("click", "a.link_to_add_fields", function(e){
    e.preventDefault();
    var link = $(this);
    var association = $(this).data("association");
    var content = $(this).data("content");
    add_fields(link, association, content);
  });

  // reload new recipe_ingredient data
  $('#add_recipe').on("click", function(e){
    e.preventDefault();
    var $target = $(e.target);
    console.log("target:");
    console.log($target);
    $.ajax({

    })
  });

  // creates new ingredient
  $('form#new_ingredient').on("submit", function(e){
    e.preventDefault();
    var $target = $(e.target);
    $.ajax({
      type: $target.attr("method"),
      url: $target.attr("action"),
      data: $target.serialize()
    }).done(function(response){
      $('.select-ingredient').append(response);
      $target[0].reset();
    });
  });
});