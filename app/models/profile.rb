class Profile < ApplicationRecord
  validates :bio, presence: true, uniqueness: true
  validates :likes, :dislikes, :gender, :sex_pref, presence: true

  belongs_to :user

  def gender
    if is_male
      'Male'
    elsif is_male == false
      'Female'
    else
      'Non-Binary'
    end
  end
end
