require 'rails_helper'

module Api
  describe CategoriesController, type: :controller do
    render_views

    let!(:category) { Category.create!(name: "Clothing", id: 1)}
    let!(:seller) {Seller.create!(name: "Greg", id: 1)}
    let!(:item) {Item.create!(title:"t-shirt", category_id: 1, seller_id: 1, status: "Available")}

    context "Get available items from a category" do
      before do
        get :available_items, params: { category_id: 1}, format: 'json'
      end

      it { is_expected.to respond_with 200}

      it "returns a category" do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['category']['name']).to eq("Clothing")
      end

      it "return first available item 't-shirt' " do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['category']['items'].first['title']).to eq("t-shirt")
      end
    end

    context "Category not found" do
      before do
        get :available_items, params: { category_id: 5 }, format: 'json'
      end

      it { is_expected.to respond_with 422}

      it "returns 'Category Not Found'" do
        expect(response.body).to eq "Category Not Found"
      end
    end
  end
end
