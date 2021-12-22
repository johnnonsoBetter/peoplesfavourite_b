require 'rails_helper'

RSpec.describe FavouriteThing, type: :model do

  it { should belong_to(:user) } 
  it { should belong_to(:thing) } 

end
