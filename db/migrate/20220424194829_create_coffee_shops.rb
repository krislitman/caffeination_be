class CreateCoffeeShops < ActiveRecord::Migration[6.1]
  def change
    create_table :coffee_shops do |t|
      t.string :yelp_id
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :rating
      t.string :location

      t.timestamps
    end
  end
end
