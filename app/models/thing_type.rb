class ThingType < ApplicationRecord
  belongs_to :thing
  validates :name, :url, presence: true

  acts_as_votable

end
