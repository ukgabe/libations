class PhotoComment < ApplicationRecord
  # Direct associations

  belongs_to :author,
             :class_name => "User"

  belongs_to :photo,
             :class_name => "CocktailPhoto"

  # Indirect associations

  # Validations

end
