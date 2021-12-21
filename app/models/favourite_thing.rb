class FavouriteThing < ApplicationRecord
  belongs_to :user
  extend FriendlyId

  validates :name, presence: true
  friendly_id :name, use: :slugged
end
