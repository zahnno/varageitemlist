Rails.application.routes.draw do
  root 'landings#home'

  namespace :api, defaults: { format: 'json' } do
    #Item routes
    resources :items, only: [:index, :show]
    #Sellers sold items routes
    get 'sellers/:seller_id/sold_items', to: 'sellers#sold_list', as: 'sold_items_list'
    #Category item routes
    get 'categories/:category_id/available_items', to: 'categories#available_items', as: 'available_items'
  end
end
