function add_fields(link, association, content){
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}


$( document ).ready(function() {
  $('#add_recipe').on("click", "a.link_to_add_fields", function(e){
    e.preventDefault();
    var link = $(this);
    var association = $(this).data("association");
    var content = $(this).data("content");
    add_fields(link, association, content);
  });

  $('form[data-remote=true]').on("ajax:success", function(e){
    // var ingredients = $("#recipe_recipe_ingredients_attributes_0_ingredient_id").DataTable({ajax: "data.json"});
    window.location.reload();
    // $('.add_ingredient').reload();
    // $('.add_ingredient').reload('/ingredients .add_ingredient', function() {});
  });
});