class Item < ApplicationRecord
  belongs_to :category
  belongs_to :seller

  validates :status, acceptance: { accept: ['Available', 'Pending', 'Sold', 'Expired', 'Banned'] }

  monetize :price_cents

  def banned?
    self.status != "Banned"
  end
end
