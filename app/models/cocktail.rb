class Cocktail < ApplicationRecord
  # Direct associations

  has_many   :cocktail_photos,
             :dependent => :destroy

  belongs_to :venue

  # Indirect associations

  # Validations

end
