require 'rails_helper'

module Api
  describe SellersController, type: :controller do
    render_views

    let!(:category) { Category.create!(name: "Clothing", id: 1)}
    let!(:seller) {Seller.create!(name: "Greg", id: 1)}
    let!(:item) {Item.create!(title:"t-shirt", category_id: 1, seller_id: 1, status: "Available")}
    let!(:item1) {Item.create!(title:"sweater", category_id: 1, seller_id: 1, status: "Sold")}

    context "Get sold item from seller" do
      before do
        get :sold_list, params: { seller_id: 1}, format: 'json'
      end

      it { is_expected.to respond_with 200}

      it "returns a seller" do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['seller']['name']).to eq("Greg")
      end

      it "returns sold item 'sweater' " do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['seller']['items'].first['status']).to eq("Sold")
        expect(parsed_response['seller']['items'].first['title']).to eq("sweater")
      end
    end

    context "Seller not found" do
      before do
        get :sold_list, params: { seller_id: 5 }, format: 'json'
      end

      it { is_expected.to respond_with 422}

      it "returns 'Seller Not Found'" do
        expect(response.body).to eq "Seller Not Found"
      end
    end
  end
end
