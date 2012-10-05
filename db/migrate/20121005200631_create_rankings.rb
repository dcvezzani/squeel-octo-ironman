class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.string :label
      t.text :description
      t.string :value
      t.integer :listing_id

      t.timestamps
    end
  end
end
