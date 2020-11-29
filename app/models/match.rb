class Match < ApplicationRecord
  has_one :request
  belongs_to :user
  belongs_to :user, foreign_key: :matched_user_id
end
