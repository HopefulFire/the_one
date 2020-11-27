class User < ApplicationRecord
  validates :email, :name, presence: true
  validates :email, uniqueness: true
  validates :uid, presence: true, uniqueness: true, if: :omniauth?

  has_secure_password

  has_one :profile

  def omniauth?
    !!uid
  end
end
