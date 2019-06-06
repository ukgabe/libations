class CreatePhotoComments < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_comments do |t|
      t.integer :author_id
      t.integer :photo_id
      t.string :body

      t.timestamps
    end
  end
end
