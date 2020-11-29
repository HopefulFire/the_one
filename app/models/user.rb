class User < ApplicationRecord
  has_one :profile
  has_many :matches
  has_many :requests

  has_secure_password

  validates :email, :name, presence: true
  validates :email, uniqueness: true
  validates :uid, presence: true, uniqueness: true, if: :omniauth?

  def profile_attributes=(profile_attributes)
    self.profile = Profile.new if profile.nil?
    profile.update(profile_attributes)
  end

  def omniauth?
    !!uid
  end
end
