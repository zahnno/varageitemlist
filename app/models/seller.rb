class Seller < ApplicationRecord
  has_many :items

  def sold_item_list
    self.items.where(status: "Sold")
  end
end
