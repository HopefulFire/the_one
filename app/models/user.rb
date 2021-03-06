class User < ApplicationRecord
  has_many(
    :sent_messages,
    class_name: :Message,
    foreign_key: :sender_id,
    inverse_of: :sender,
    dependent: :destroy
  )
  has_many(
    :received_messages,
    class_name: :Message,
    foreign_key: :receiver_id,
    inverse_of: :receiver,
    dependent: :destroy
  )
  has_many(
    :sent_users,
    class_name: :User,
    foreign_key: :receiver_id,
    through: :sent_messages,
    source: :receiver
  )
  has_many(
    :received_users,
    class_name: :User,
    foreign_key: :sender_id,
    through: :received_messages,
    source: :sender
  )
  has_one :profile, dependent: :destroy, inverse_of: :user
  has_secure_password

  validates :email, :provider, :uid, presence: true
  validates :email, uniqueness: true, format: { with: /\A[\w.]+@\w+\.\w+\z/i }

  scope :with_profile, -> { joins(:profile).order(nickname: :asc) }

  def self.find_or_create_by_auth_hash(auth_hash)
    info = auth_hash[:info]
    user = User.find_or_create_by(email: info[:email])
    return user if user.update(
      uid: auth_hash[:uid],
      provider: auth_hash[:provider],
      password: SecureRandom.hex
    )

    nil
  end
end
