squeel-octo-ironman
====================

Rails app that includes an example of a Squeel issue with multiple joins on the same table.

After a little research to make sure I'm not resurfacing the same problem that has already been
adressed, I wanted to provide a means of duplicating some odd behavior with multiple joins being 
performed on one table 'A' with two references to table 'B':

I have two models that inherit (STI) from the same table, so the table name is 'categories'.

    create_table "categories", :force => true do |t|
      t.string   "name"
      t.string   "symbol"
      t.string   "notes"
      t.integer  "author_id"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.string   "type"
    end

Here are the models involved:

    [app/models/category.rb]
    class Category < ActiveRecord::Base
      attr_accessible :name, :notes, :symbol
    end

    [app/models/listing_audience.rb]
    class ListingAudience < Category
      has_many :listings, foreign_key: "audience_id"
    end

    [app/models/listing_category.rb]
    class ListingCategory < Category
      has_many :listings, foreign_key: "category_id"
    end

    [app/models/listing.rb]
    class Listing < ActiveRecord::Base
      attr_accessible :name, :content, :audience_id, :category_id

      belongs_to :audience, class_name: "ListingAudience"
      belongs_to :category, class_name: "ListingCategory"

      has_one :ranking
    end

    [app/models/ranking.rb]
    class Ranking < ActiveRecord::Base
      attr_accessible :label, :description, :value, :listing_id

      belongs_to :listing, class_name: "Listing"
    end

Here is the query that I'm having a little grief with:

    puts sql = Ranking.joins{[listing.audience, listing.category]}.
      select{[listing.audience.name.op('||', " / ").op('||', listing.category.name).as("audience_category")]}.
      group{audience_category}.
      to_sql

The references to 'listing.audience' and 'listing.category' should, according to the Squeel documentation, 
create alias references on their own.  This is the sql being generated from the call:

    SELECT "categories"."name" || ' / ' || "categories_listings"."name" AS audience_category 
    FROM "rankings" 

    INNER JOIN "listings" ON "listings"."id" = "rankings"."listing_id" 
    INNER JOIN "categories" ON "categories"."id" = "listings"."audience_id" AND "categories"."type" IN ('ListingAudience') 
    INNER JOIN "categories" "categories_listings" ON "categories_listings"."id" = "listings"."category_id" AND "categories_listings"."type" IN ('ListingCategory') 

    GROUP BY "rankings"."audience_category"

Notice what I'm calling the discrepancy?

    INNER JOIN "categories" "categories_listings" ON "categori...
                          ^^^

Everything would work if only the keyword 'as' was included.

    INNER JOIN "categories" as "categories_listings" ON "categori...
                          ^^^^^^

Am I improperly using Squeel or should this work?


Rails app setup
======================

I use PostgreSQL, so my example below show the options I use to set up my database.  The most important
this is that you set up your own config/database.yml file and that the database are created.

    # log in as super user
    # copy/paste into terminal
    psql -d postgres -U <username>

    # create user and database
    # copy/paste into the psql session
    create user squeel_joins_admin with password <password>;
    CREATE DATABASE squeel_joins_development OWNER squeel_joins_admin;
    GRANT ALL ON DATABASE squeel_joins_development TO squeel_joins_admin; 

    # create test user and test database that can run with rspec tests
    # copy/paste into the psql session
    CREATE USER rails with SUPERUSER CREATEDB password <password>;
    CREATE DATABASE squeel_joins_test OWNER rails;
    GRANT ALL ON DATABASE squeel_joins_test TO rails; 

    # if using texticle fuzzy search, include the extensions manually
    # copy/paste into the psql session
    \l
    \c fidushree_development
    DROP EXTENSION IF EXISTS pg_trgm;
    CREATE EXTENSION pg_trgm;
    \dx
    \dn

    \c fidushree_test
    DROP EXTENSION IF EXISTS pg_trgm;
    CREATE EXTENSION pg_trgm;
    \dx
    \dn

    \q

    # create config/database.yml
    # paste this in terminal while in your Rails.root
    # -e renders newlines (\n)
    # '!' escapes the history (!) character
    echo -e "development:\n  adapter: postgresql\n  database: squeel_joins_development\n  username: squeel_joins_admin\n  password: pass13"'!'"#\n  encoding: utf8\n  pool: 5\n \ntest: \n  adapter: postgresql\n  database: squeel_joins_test\n  username: rails\n  password: rails.pass13"'!'"#\n  encoding: utf8\n  pool: 5" > config/database.yml


Fire it up
======================

The method of duplication here is to start up the Rails console and paste the command at the prompt.  
But first, we need to finish setting up and populating the database with some data:

    bundle install
    bundle exec rake db:migrate db:migrate:status db:seed
    rails c

Here's the Squeel command again:

    puts sql = Ranking.joins{[listing.audience, listing.category]}.
      select{[listing.audience.name.op('||', " / ").op('||', listing.category.name).as("audience_category")]}.
      group{audience_category}.
      to_sql

Am I barking up the wrong tree with this?  It sure would be nice if it should work and does.  In the mean time, I have 
embedded the SQL directly in my code, adding the 'as' alias keyword so that I can move forward.
