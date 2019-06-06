class CocktailPhoto < ApplicationRecord
  # Direct associations

  belongs_to :owner,
             :class_name => "User"

  has_many   :photo_likes,
             :foreign_key => "photo_id",
             :dependent => :destroy

  has_many   :photo_comments,
             :foreign_key => "photo_id",
             :dependent => :destroy

  belongs_to :cocktail

  # Indirect associations

  # Validations

end
