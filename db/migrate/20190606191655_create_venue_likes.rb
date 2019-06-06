class CreateVenueLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :venue_likes do |t|
      t.integer :user_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
