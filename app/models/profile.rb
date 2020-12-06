class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile

  validates :nickname, presence: true
end
