Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :github,
    Rails.application.credentials.github[:client_id],
    Rails.application.credentials.github[:client_secret]
  )
  provider(
    :google_oauth2,
    Rails.application.credentials.google[:client_id],
    Rails.application.credentials.google[:client_secret]
  )
end