class Profile < ApplicationRecord
  validates :bio, presence: true, uniqueness: true
  validates :likes, :dislikes, :gender, :sex_pref, presence: true

  belongs_to :user
end
