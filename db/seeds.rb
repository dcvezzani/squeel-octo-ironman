# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Ranking.destroy_all
# Listing.destroy_all
# ListingAudience.destroy_all
# ListingCategory.destroy_all
# puts "clearing out all data from rankings, listings and categories tables"

# populate data into the associated tables
categories = []
categories << %w{novice intermediate advanced master}
categories << %w{red green blue gold violet orange}
categories << %w{cherry lemon lime orange apple grape}
categories << %w{cedar pine oak maple redwood}
categories << %w{tomato corn squash broccoli carrot}
categories << %w{ford mazda toyota gmc pontiac buick}
categories << %w{ladle teaspoon fork knife }
categories << %w{shirt pants socks shoes belt}

categories = []
categories += %w{cherry lemon lime orange apple grape}
categories += %w{cedar pine oak maple redwood}
categories += %w{tomato corn squash broccoli carrot}

# populate ListingAudience records for 'categories' table
%w{business entertainment social media garden auto retail food}.each{|audience|
  ListingAudience.create!(name: audience)
}
puts "populated ListingAudience records for 'categories' table"

# populate ListingCategory records for 'categories' table
categories.each{|category|
  ListingCategory.create!(name: category)
}
puts "populated ListingCategory records for 'categories' table"

audiences = ListingAudience.all
categories = ListingCategory.all

# populate the 'rankings' table
[1,2,6,10].each{|ranking_value|
  Ranking.create!(value: ranking_value)
}
puts "populated 'rankings' table"

rankings = Ranking.all


# populate the 'listings' table
Listing.create!(name: "item-001", audience_id: audiences[0].id, category_id: categories[0].id)
Listing.create!(name: "item-002", audience_id: audiences[0].id, category_id: categories[0].id)

Listing.create!(name: "item-003", audience_id: audiences[1].id, category_id: categories[1].id)
Listing.create!(name: "item-004", audience_id: audiences[1].id, category_id: categories[2].id)
Listing.create!(name: "item-005", audience_id: audiences[1].id, category_id: categories[2].id)

Listing.create!(name: "item-006", audience_id: audiences[2].id, category_id: categories[8].id)
Listing.create!(name: "item-007", audience_id: audiences[2].id, category_id: categories[8].id)

Listing.create!(name: "item-008", audience_id: audiences[3].id, category_id: categories[10].id)

Listing.create!(name: "item-009", audience_id: audiences[4].id, category_id: categories[7].id)
Listing.create!(name: "item-010", audience_id: audiences[4].id, category_id: categories[9].id)

Listing.create!(name: "item-011", audience_id: audiences[5].id, category_id: categories[3].id)
Listing.create!(name: "item-012", audience_id: audiences[5].id, category_id: categories[3].id)
Listing.create!(name: "item-013", audience_id: audiences[5].id, category_id: categories[12].id)
puts "populated 'listings' table"

# assign ranking records to the listings
listings = Listing.all.each{|listing|
  listing.ranking = rankings[rand(0...4)]
}
puts "associated ranking records with listings"




