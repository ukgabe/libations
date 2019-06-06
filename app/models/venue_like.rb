class VenueLike < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :venue,
             :counter_cache => true

  # Indirect associations

  # Validations

end
