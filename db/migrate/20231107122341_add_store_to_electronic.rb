class AddStoreToElectronic < ActiveRecord::Migration[7.1]
  def change
    add_reference :electronics, :store, null: false, foreign_key: true
  end
end
