class Word < ApplicationRecord
  belongs_to :guess
  before_create :reward_user

  validates :content, presence: true


  private 

  def reward_user 

    user = self.guess.user

    user.increment!(:score, 1)
  end

end
