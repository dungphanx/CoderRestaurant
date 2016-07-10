class Order < ApplicationRecord
  belongs_to :food_item
  validates :food_item, :name, :phone, :adress, presence: true

  
end
