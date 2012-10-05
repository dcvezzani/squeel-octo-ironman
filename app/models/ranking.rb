class Ranking < ActiveRecord::Base
  attr_accessible :description, :label, :listing_id, :value

  belongs_to :listing, class_name: "Listing"
end
