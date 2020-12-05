class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, format: { with: /\A[\w.]+@\w+\.\w+\z/i }

  def self.find_or_create_by_auth_hash(auth_hash)
    info = auth_hash[:info]
    case auth_hash[:provider]
    when 'github'
      User.find_or_create_by(email: info[:email]) do |user|
        user.uid = auth_hash[:uid]
      end
    end
  end
end
