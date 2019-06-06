class CreateCocktails < ActiveRecord::Migration[5.1]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :ingredients
      t.integer :likes_count
      t.integer :comment_count
      t.integer :venue_id

      t.timestamps
    end
  end
end
