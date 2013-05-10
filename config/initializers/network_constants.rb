network_config = YAML::load(File.open("#{Rails.root}/config/social-networks.yml"))
TWITTER_KEY = network_config[Rails.env]['twitter']['key']
TWITTER_SECRET = network_config[Rails.env]['twitter']['secret']
FACEBOOK_KEY = network_config[Rails.env]['facebook']['key']
FACEBOOK_SECRET = network_config[Rails.env]['facebook']['secret']