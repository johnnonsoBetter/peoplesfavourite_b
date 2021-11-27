class FavouriteThing < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  has_many :favourite_thing_types, dependent: :destroy
end
