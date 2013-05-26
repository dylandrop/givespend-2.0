database_config = YAML::load(File.open("#{Rails.root}/config/database.yml"))
db_name = database_config[Rails.env]['database']
username = database_config[Rails.env]['username']
password = database_config[Rails.env]['password']
port = database_config[Rails.env]['port']
ENV["DATABASE_URL"] = "postgres://#{username}:#{password}@localhost:#{port}/#{db_name}"