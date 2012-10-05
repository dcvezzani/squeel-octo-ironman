class ListingAudience < Category
  has_many :listings, foreign_key: "audience_id"
end
