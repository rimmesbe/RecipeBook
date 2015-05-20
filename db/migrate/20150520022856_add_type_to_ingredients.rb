class AddTypeToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :food_type, :string
  end
end
