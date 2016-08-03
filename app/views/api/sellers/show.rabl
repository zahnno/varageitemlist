object @seller
attributes :name, :longitude, :latitude

node :items do |seller|
  partial 'api/sellers/sold_item_list', object: seller.sold_item_list
end
