class User < ApplicationRecord
  has_many :sent_messages, class_name: :Message, foreign_key: :sender_id, inverse_of: :sender
  has_many :received_messages, class_name: :Message, foreign_key: :receiver_id, inverse_of: :receiver
  has_many :users_sent, class_name: :User, foreign_key: :receiver_id, source: :receiver, through: :sent_messages
  has_many :users_received, class_name: :User, foreign_key: :sender_id, source: :sender, through: :received_messages

  has_secure_password
  validates :email, :nickname, presence: true
  validates :uid, uniqueness: true, if: :uid

  def self.github_authenticate(authorize_params)
    user = User.find_by(uid: authorize_params.fetch('uid'))
    return user unless user.nil?

    User.create!(
      uid: authorize_params.fetch('uid'),
      email: authorize_params.fetch('info').fetch('email'),
      nickname: authorize_params.fetch('info').fetch('nickname')
    )
  end
end
