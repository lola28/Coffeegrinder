class CreateCheckIns < ActiveRecord::Migration[5.2]
  def change
    create_table :check_ins do |t|
      t.references :user, foreign_key: true
      t.references :coffeehouse, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
