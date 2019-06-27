class AddLatitudeToCoffeehouse < ActiveRecord::Migration[5.2]
  def change
    add_column :coffeehouses, :latitude, :float
  end
end
