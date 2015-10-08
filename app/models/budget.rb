class Budget < ActiveRecord::Base
  belongs_to :account
  has_many :budget_items
  has_many :products, :through => :budget_items

end
