function add_fields(link, association, content){
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

$( document ).ready(function() {
  // dynamically adds ingredient fields for new recipe
  $('#add_recipe').on("click", "a.link_to_add_fields", function(e){
    e.preventDefault();
    var link = $(this);
    var association = $(this).data("association");
    var content = $(this).data("content");
    add_fields(link, association, content);
  });

  // dynamically adds ingredient fields for editing recipes
  $('#edit_recipe').on("click", "a.link_to_edit_fields", function(e){
    e.preventDefault();
    var link = $(this);
    var association = $(this).data("association");
    var content = $(this).data("content");
    add_fields(link, association, content);
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