class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :brand
      t.integer :power
      t.string :color
      t.integer :seat_capacity
      t.text :description
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
