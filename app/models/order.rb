class Order < ApplicationRecord
  belongs_to :food_item
  validates :food_item, :name, :phone, :address, :quantity, presence: true

end
