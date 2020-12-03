class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates :nickname, :firstname, :lastname, :email, :provider, :uid, presence: true
  validates :email, :uid, uniqueness: true
  validates :provider, inclusion: { in: %w[identity] }
end
