class User < ApplicationRecord
  validates :email, :nickname, presence: true
  validates :uid, presence: true, uniqueness: true, if: :omniauth?
  validates :password, presence: true, uniqueness: true, unless: :omniauth?

  has_secure_password

  private

  def omniauth?
    if uid
      true
    else
      false
    end
  end
end
