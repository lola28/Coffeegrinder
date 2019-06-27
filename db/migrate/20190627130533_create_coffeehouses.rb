class CreateCoffeehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :coffeehouses do |t|
      t.string :name
      t.string :location
      t.datetime :openingtime
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
