class Listing < ActiveRecord::Base
  attr_accessible :audience_id, :author_id, :category_id, :content, :name

  belongs_to :author, class_name: "User"
  belongs_to :audience, class_name: "ListingAudience"
  belongs_to :category, class_name: "ListingCategory"

  has_one :ranking
end
