class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.integer :comment_count
      t.integer :likes_count
      t.string :photo
      t.string :description

      t.timestamps
    end
  end
end
