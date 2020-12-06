class User < ApplicationRecord
  has_one :profile, dependent: :destroy, inverse_of: :user
  has_secure_password

  validates :email, uniqueness: true, format: { with: /\A[\w.]+@\w+\.\w+\z/i }

  def self.find_or_create_by_auth_hash(auth_hash)
    info = auth_hash[:info]
    user = User.find_or_create_by(email: info[:email])
    return user if user.update(
      uid: auth_hash[:uid],
      provider: auth_hash[:provider],
      password: SecureRandom.hex
    )

    nil
  end
end
