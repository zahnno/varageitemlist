module Api
  class ItemsController < ApplicationController
    respond_to :json

    def index
      @items = Item.all
      respond_with(@items)
    end

    def show
      @item = Item.find_by_id(params[:id])
      if @item.present?
        respond_with(@item)
      else
        render html: "Item Not Found".html_safe, status: 422
      end
    end
  end
end
