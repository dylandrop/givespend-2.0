class Authentication < ActiveRecord::Base
  belongs_to :authenticatable, polymorphic: true
  attr_accessible :code, :provider, :uid, :token, :secret
end
