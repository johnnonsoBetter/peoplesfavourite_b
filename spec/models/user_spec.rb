require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:favourite_things) } 
  it { should have_many(:guesses) } 
  it { should have_db_index(:slug) } 
end
