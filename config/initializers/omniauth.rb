Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    Rails.application.credentials.google[:client_id],
    Rails.application.credentials.google[:client_secret]

  provider :identity,
    on_failed_registration: lambda { |env|
      IdentitiesController.action(:new).call(env)
    }
end
