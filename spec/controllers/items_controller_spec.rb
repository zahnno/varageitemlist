require 'rails_helper'

module Api
  describe ItemsController, type: :controller do
    render_views

    let!(:category) { Category.create!(name: "Clothing", id: 1)}
    let!(:seller) {Seller.create!(name: "Greg", id: 1)}
    let!(:item) {Item.create!(title:"t-shirt", category_id: 1, seller_id: 1, status: "Available")}
    let!(:item1) {Item.create!(title:"golf shirt", category_id: 1, seller_id: 1, status: "Sold")}
    let!(:item2) {Item.create!(title:"sweater", category_id: 1, seller_id: 1, status: "Banned")}

    context "As anonymous user" do
      it "Get all 3 items" do
        get :index, format: 'json'

        parsed_response = JSON.parse(response.body)
        expect(parsed_response['items'].length).to eq(3)
      end

      it "Get one item" do
        get :show, params: { id: 1 }, format: 'json'

        parsed_response = JSON.parse(response.body)
        expect(parsed_response['item']['title']).to eq("t-shirt")
      end

      it "Get non banned item" do
        get :show, params: { id: 1 }, format: 'json'

        parsed_response = JSON.parse(response.body)
        expect(parsed_response['item']['title']).to eq("t-shirt")
        expect(parsed_response['item']['created_at']).not_to eq(nil)
        expect(parsed_response['item']['seller']['name']).to eq('Greg')
      end

      context "Banned items do not show publish date and sellers name" do
      #All item requests point to index and show. If these fail they will fail for category and seller items
        it "For all items" do
          get :index, format: 'json'

          parsed_response = JSON.parse(response.body)
          expect(parsed_response['items'].last['item']['status']).to eq("Banned")
          expect(parsed_response['items'].last['item']['seller']).not_to eq(parsed_response['items'].first['item']['seller']['name'])
          expect(parsed_response['items'].last['item']['created_at']).to eq(nil)
        end

        it "For one item" do
          get :show, params: { id: 3 }, format: 'json'

          parsed_response = JSON.parse(response.body)
          expect(parsed_response['item']['title']).to eq("sweater")
          expect(parsed_response['item']['seller']['name']).to eq(nil)
          expect(parsed_response['item']['created_at']).to eq(nil)
        end
      end
    end
  end
end
