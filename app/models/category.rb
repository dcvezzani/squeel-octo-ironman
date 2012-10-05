class Category < ActiveRecord::Base
  attr_accessible :author_id, :name, :notes, :symbol
end
