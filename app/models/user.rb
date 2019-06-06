class User < ApplicationRecord
  # Direct associations

  has_many   :venue_likes,
             :dependent => :destroy

  has_many   :venue_comments,
             :foreign_key => "author_id",
             :dependent => :destroy

  has_many   :follow_requests,
             :foreign_key => "sender_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
