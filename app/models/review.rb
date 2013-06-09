class Review < ActiveRecord::Base
  belongs_to :item
  attr_accessible :description, :rating
end
