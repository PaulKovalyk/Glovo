class LineItem < ApplicationRecord
  belongs_to :dishes
  belongs_to :carts
  belongs_to :orders
end
