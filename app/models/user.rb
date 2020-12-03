class User < ApplicationRecord
  validates :nickname, :provider, :email, :uid, presence: true
  validates :email, :uid, uniqueness: true
end
