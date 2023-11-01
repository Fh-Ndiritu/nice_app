class ChangePriceType < ActiveRecord::Migration[7.1]
    def change
      add_column :electronics, :price, :decimal, precision: 8, scale:2, default: 0.00
    end
end
