class HomeController < ApplicationController
  def index
    product_categories
    @popular_products = Product.order("impressions_count DESC").limit(6)
  end

end
