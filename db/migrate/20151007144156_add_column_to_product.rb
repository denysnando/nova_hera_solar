class AddColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products, :balance, :decimal,  precision: 8, scale: 2, default: 0.0
  end
end
