class CreateVenueComments < ActiveRecord::Migration[5.1]
  def change
    create_table :venue_comments do |t|
      t.integer :author_id
      t.integer :venue_id
      t.string :body

      t.timestamps
    end
  end
end
