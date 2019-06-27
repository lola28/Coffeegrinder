class AddLongitudeToCoffeehouse < ActiveRecord::Migration[5.2]
  def change
    add_column :coffeehouses, :longitude, :float
  end
end
