class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :author_id
      t.string :name
      t.text :notes
      t.string :symbol
      t.string :type

      t.timestamps
    end
  end
end
