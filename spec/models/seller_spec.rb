require 'rails_helper'

describe Seller do
  let!(:category) { Category.create!(name: "Clothing", id: 1)}
  let!(:seller) {Seller.create!(name: "Greg", id: 1)}
  let!(:item) {Item.create!(title:"t-shirt", category_id: 1, seller_id: 1, status: "Sold")}
  let!(:item1) {Item.create!(title:"sweater", category_id: 1, seller_id: 1, status: "Available")}

  it "should have many items" do
    expect(Seller.reflect_on_association(:items).macro).to eq :has_many
  end

  it "is valid with valid attributes" do
    expect(Seller.create(name: "Connor")).to be_valid
  end

  it "sold_item_list is valid" do
    expect(seller.items.last.status).to eq("Available")
    expect(seller.sold_item_list.first).to eq(item)
    expect(seller.sold_item_list.first.status).to eq("Sold")
  end
end
