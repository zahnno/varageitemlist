require 'rails_helper'

describe Category do

  let!(:category) { Category.create!(name: "Clothing", id: 1)}
  let!(:seller) {Seller.create!(name: "Greg", id: 1)}
  let!(:item) {Item.create!(title:"t-shirt", category_id: 1, seller_id: 1, status: "Available")}

  it "should have many items" do
    expect(Category.reflect_on_association(:items).macro).to eq :has_many
  end

  it "is valid with valid attributes" do
    expect(Category.create(name: "Clothing")).to be_valid
  end

  it "available_item_list is valid" do
    expect(category.available_item_list.first).to eq(item)
    expect(category.available_item_list.first.status).to eq("Available")
  end
end
