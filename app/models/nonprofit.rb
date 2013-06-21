class Nonprofit < ActiveRecord::Base
  include Givespend::Application.routes.url_helpers

  attr_accessible :email, :info, :name, :website
  has_many :items
  has_one :authentication, as: :authenticatable

  def self.find_and_create_auth! identifier, auth_hash
    index = /\d+/.match(identifier)[0].to_i
    nonprofit = self.find(index).build_authentication auth_hash
    nonprofit.save!
  end
end
