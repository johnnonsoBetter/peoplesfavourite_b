require 'rails_helper'

RSpec.describe Word, type: :model do
  it { should validate_presence_of(:content) }

  context "when a new word has been created," do
    let(:user){create :user, id: 4, score: 2, email: "e@gmail.com", password: "password"}
    let(:thing){create :thing, name: "toys"}
    let(:thing_type){create :thing_type, name: "toys-brick", thing: thing}
    let(:guess){create :guess, user: user, thing_type: thing_type}

    it "increment the word guesser score by 1" do
    
      expect{
        create :word, content: "toys-brick", guess: guess
      }.to change{User.find(user.id).score}.by(1)


    end
    
  end
  
end
