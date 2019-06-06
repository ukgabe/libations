class Venue < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :venue_likes,
             :dependent => :destroy

  has_many   :venue_comments,
             :dependent => :destroy

  has_many   :cocktails,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
