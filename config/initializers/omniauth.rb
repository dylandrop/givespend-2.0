Devise.setup do |config|
  config.omniauth :facebook, FACEBOOK_KEY, FACEBOOK_SECRET
  config.omniauth :twitter, TWITTER_KEY, TWITTER_SECRET
end