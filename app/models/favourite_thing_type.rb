class FavouriteThingType < ApplicationRecord
  belongs_to :favourite_thing

  validates :name, presence: true
  acts_as_likeable
end
