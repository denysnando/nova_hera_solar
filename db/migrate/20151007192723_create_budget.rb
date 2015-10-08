class CreateBudget < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer  :account_id, references: :accounts
      t.float    :media_kw
      t.float    :balance_total

      t.timestamps
    end
  end
end
