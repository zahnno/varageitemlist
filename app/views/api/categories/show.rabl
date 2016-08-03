object @category
attributes :name

node :items do |category|
  partial 'api/categories/available_items', object: category.available_item_list
end
