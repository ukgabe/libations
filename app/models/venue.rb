class Venue < ApplicationRecord
  # Direct associations

  has_many   :cocktails,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
