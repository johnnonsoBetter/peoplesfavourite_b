class Guess < ApplicationRecord
  belongs_to :user
  belongs_to :thing_type

  has_many :words, dependent: :destroy
end
