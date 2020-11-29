class Match < ApplicationRecord
  has_many :messages
  has_one :request
  belongs_to :user

  # belongs_to :user, foreign_key: :matched_user_id (wish activerecord had association_name:)
  def matched_user
    User.find_by(id: matched_user_id)
  end

  def matched_user=(matched_user)
    self.matched_user_id = matched_user.id
  end
end
