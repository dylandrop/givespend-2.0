class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code, :provider, :uid, :token
end
