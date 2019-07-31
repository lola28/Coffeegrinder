class ChangeDateFormatInMyTable < ActiveRecord::Migration[5.2]
  def change
    change_column :coffeehouses, :openingtime, :text
  end
end
