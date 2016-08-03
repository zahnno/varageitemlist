module Api
  class SellersController < ApplicationController
    respond_to :json

    def sold_list
      @seller = Seller.find_by_id(params[:seller_id])
      if @seller.present?
        respond_with(@seller,  template: 'api/sellers/show', status: 200)
      else
        render html: "Seller Not Found".html_safe, status: 422
      end
    end
  end
end
