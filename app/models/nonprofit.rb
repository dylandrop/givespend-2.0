class Nonprofit < ActiveRecord::Base
  attr_accessible :email, :info, :name, :website
end
