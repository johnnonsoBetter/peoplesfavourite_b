class FavouriteThing < ApplicationRecord
  belongs_to :user
  extend FriendlyId

  validates :name, presence: true
  has_many :favourite_thing_types, dependent: :destroy
  friendly_id :name, use: :slugged
end
