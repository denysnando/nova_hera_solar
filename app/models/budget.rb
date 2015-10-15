class Budget < ActiveRecord::Base
  belongs_to :account
  has_many :budget_items

  accepts_nested_attributes_for :budget_items, reject_if: :all_blank, allow_destroy: true

  before_save :update_total

  private
    def update_total
      self.balance_total = budget_items.map(&:calc_sub_total).sum
    end
end
