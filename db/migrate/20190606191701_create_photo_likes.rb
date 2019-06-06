class CreatePhotoLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_likes do |t|
      t.integer :photo_id
      t.integer :user_id

      t.timestamps
    end
  end
end
