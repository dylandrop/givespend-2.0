STRIPE_PUBLIC = ENV['stripe_public']
Stripe.api_key = ENV['stripe_secret']

Devise.setup do |config|
  config.omniauth :stripe_connect, ENV['stripe_client_id'], ENV['stripe_secret'], :scope => 'read_write', :stripe_landing => 'register'
end