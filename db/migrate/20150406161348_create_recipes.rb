class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :instruction
      t.references :user

      t.timestamps null: false
    end
  end
end
