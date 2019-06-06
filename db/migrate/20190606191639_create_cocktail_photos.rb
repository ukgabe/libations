class CreateCocktailPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :cocktail_photos do |t|
      t.string :image
      t.string :caption
      t.integer :owner_id
      t.integer :cocktail_id
      t.integer :comment_count
      t.integer :likes_count

      t.timestamps
    end
  end
end
