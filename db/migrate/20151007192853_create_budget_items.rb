class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.integer :product_id, references: :product
      t.float :amount
      t.float :sub_total_price
      t.integer :budget_id, references: :budgets

      t.timestamp
    end
  end
end
