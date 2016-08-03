require 'rails_helper'

describe Item do

  let!(:category) { Category.create!(name: "Clothing", id: 1)}
  let!(:seller) {Seller.create!(name: "Greg", id: 1)}
  let!(:item) {Item.create!(title:"t-shirt", category_id: 1, seller_id: 1, status: "Available")}

  it "should belong_to category" do
    expect(Item.reflect_on_association(:category).macro).to eq :belongs_to
  end

  it "should belong_to seller" do
    expect(Item.reflect_on_association(:seller).macro).to eq :belongs_to
  end

  it "is valid with valid attributes" do
    expect(item).to be_valid
  end

  it "is not valid without any valid attributes" do
    expect(Item.new).not_to be_valid
  end

  it "is not valid without category" do
    item.update_attribute(:category_id, 2)
    expect(item).not_to be_valid
  end

  it "is not valid without seller_id" do
    item.update_attribute(:seller_id, 2)
    expect(item).not_to be_valid
  end

  it "is not valid without proper status" do
    item.update_attribute(:status, "Invalid")
    expect(item).not_to be_valid
  end
end
