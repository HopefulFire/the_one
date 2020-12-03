class User < ApplicationRecord
  has_many :sent_messages, class_name: :Message, foreign_key: :sender_id, inverse_of: :sender
  has_many :received_messages, class_name: :Message, foreign_key: :receiver_id, inverse_of: :receiver


  validates :nickname, :provider, :email, :uid, presence: true
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
