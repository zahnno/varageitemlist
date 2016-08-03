class Category < ApplicationRecord
  has_many :items

  def available_item_list
    self.items.where(status: "Available")
  end
end
