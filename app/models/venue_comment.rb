class VenueComment < ApplicationRecord
  # Direct associations

  belongs_to :author,
             :class_name => "User"

  belongs_to :venue

  # Indirect associations

  # Validations

end
