class Venue < ApplicationRecord
  # Direct associations

  has_many   :venue_comments,
             :dependent => :destroy

  has_many   :cocktails,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
