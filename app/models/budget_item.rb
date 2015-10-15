class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :product

  def calc_sub_total
    amount * sub_total_price
  end
end
