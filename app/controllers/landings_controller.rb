class LandingsController < ApplicationController

  def home
    @categories = Category.all
    @sellers = Seller.all
    @items = Item.all
    render template: 'landings/home'
  end
end
