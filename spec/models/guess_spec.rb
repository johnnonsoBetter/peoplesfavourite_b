require 'rails_helper'

RSpec.describe Guess, type: :model do
  it { should have_many(:words) } 
  it { should belong_to(:thing_type) } 
end
