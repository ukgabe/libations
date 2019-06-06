class AddVenueLikeCountToVenues < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :venue_likes_count, :integer
  end
end
