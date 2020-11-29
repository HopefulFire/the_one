class User < ApplicationRecord
  has_many :requests
  has_many :matches
  has_many :messages
  has_one :profile

  has_secure_password

  validates :email, :name, presence: true
  validates :email, uniqueness: true
  validates :uid, presence: true, uniqueness: true, if: :omniauth?

  def users
    Match.where(user_id: id).map(&:user)
  end

  def profile_attributes=(profile_attributes)
    self.profile = Profile.new if profile.nil?
    profile.update(profile_attributes)
  end

  def omniauth?
    !!uid
  end
end
