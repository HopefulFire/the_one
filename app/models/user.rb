class User < ApplicationRecord
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
