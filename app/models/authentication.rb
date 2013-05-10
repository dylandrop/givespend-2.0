class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code, :key, :provider, :secret, :uid
end
