class ListingCategory < Category
  has_many :listings, foreign_key: "category_id"
end

