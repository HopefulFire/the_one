class User < ApplicationRecord
  has_many :sent_messages, class_name: :Message, foreign_key: :sender_id, inverse_of: :sender
  has_many :received_messages, class_name: :Message, foreign_key: :receiver_id, inverse_of: :receiver
  has_many :users_sent, class_name: :User, foreign_key: :receiver_id, through: :sent_messages, source: :receiver
  has_many :users_received, class_name: :User, foreign_key: :sender_id, through: :received_messages, source: :sender

  validates :name, :firstname, :lastname, :provider, :email, :uid, presence: true
  validates :email, uniqueness: true

  def provider_english
    case provider
    when 'google_oauth2'
      'Google'
    when 'identity'
      'No Provider (You logged in with an email and a password)'
    end
  end
end
