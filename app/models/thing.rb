class Thing < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_many :thing_types
end
