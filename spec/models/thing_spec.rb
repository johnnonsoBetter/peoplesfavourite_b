require 'rails_helper'

RSpec.describe Thing, type: :model do
  it { should have_many(:thing_types) } 
end
