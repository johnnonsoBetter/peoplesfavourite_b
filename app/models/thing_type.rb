class ThingType < ApplicationRecord
  belongs_to :thing
  validates :name, :url, presence: true
end
