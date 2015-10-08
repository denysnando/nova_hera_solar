class Product < ActiveRecord::Base
  belongs_to :category
  has_many :budget_items

  validates :name, presence: true
end
