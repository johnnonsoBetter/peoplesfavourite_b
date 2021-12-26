# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  extend FriendlyId

  validates :name, presence: true
  has_many :favourite_things, dependent: :destroy
  has_many :guesses, dependent: :destroy
  friendly_id :name, use: :slugged

  acts_as_voter
  

end
