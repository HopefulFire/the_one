class Profile < ApplicationRecord
  validates :bio, :likes, :dislikes, :gender, :sex_pref, presence: true

  belongs_to :user
end
