class Comment < ApplicationRecord
  belongs_to :food_item
  validates :food_item, :title, :body, presence: true
end
