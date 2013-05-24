stripe_config = YAML::load(File.open("#{Rails.root}/config/stripe.yml"))
STRIPE_CLIENT_ID = stripe_config[Rails.env]['client_id']
STRIPE_SECRET = stripe_config[Rails.env]['stripe_secret']
STRIPE_PUBLIC = stripe_config[Rails.env]['stripe_public']
Stripe.api_key = STRIPE_SECRET

Devise.setup do |config|
  config.omniauth :stripe_connect, STRIPE_CLIENT_ID, STRIPE_SECRET, :scope => 'read_write', :stripe_landing => 'register'
end