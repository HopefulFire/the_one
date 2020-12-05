class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, format: { with: /\A[\w.]+@\w+\.\w+\z/i }
end
