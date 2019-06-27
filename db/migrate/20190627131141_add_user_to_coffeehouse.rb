class AddUserToCoffeehouse < ActiveRecord::Migration[5.2]
  def change
    add_reference :coffeehouses, :user, foreign_key: true
  end
end
