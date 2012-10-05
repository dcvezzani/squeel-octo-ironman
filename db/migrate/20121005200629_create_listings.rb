class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :content
      t.integer :audience_id
      t.integer :category_id
      t.integer :author_id

      t.timestamps
    end
  end
end
