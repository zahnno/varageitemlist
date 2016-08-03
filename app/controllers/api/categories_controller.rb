module Api
  class CategoriesController < ApplicationController
    respond_to :json

    def available_items
      @category = Category.find_by_id(params[:category_id])
      if @category.present?
        respond_with(@category, template: 'api/categories/show', status: 200)
      else
        render html: "Category Not Found".html_safe, status: 422
      end
    end
  end
end
