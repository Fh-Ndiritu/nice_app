class RenameModelToCarsModelInCars < ActiveRecord::Migration[7.1]
  def change
    rename_column :cars, :model, :car_model
  end
end
