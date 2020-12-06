class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile

  validates :nickname, :user_id, presence: true
  validates :user_id, uniqueness: true
end
