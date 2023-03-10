class HomeController < ApplicationController
  def index
    @sales_by_category = Category.joins(products: :sales)
                                 .group("categories.id")
                                 .select("categories.name, count(sales.id) as number_of_sales")
  end
end
