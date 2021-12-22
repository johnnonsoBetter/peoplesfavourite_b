class FavouriteThing < ApplicationRecord
  before_create :set_name
  belongs_to :user
  belongs_to :thing
  extend FriendlyId

  friendly_id :name, use: :slugged


  private 

  def set_name 
    
    self.name = self.thing.name
  end 
end
