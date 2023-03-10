class HomeController < ApplicationController
  def index
    @sales_per_category = sales_per_category
  end

  private

  # Vamos a recorrer las ventas por categoría de manera que nos retorne un hash con los resultados
  def sales_per_category
    results = {}
    Category.all.each do |category|
      total_sales = category.sales_product.size
      total_quantity = category.sales_product.sum(&:quantity)
      results[category] = { :total_sales => total_sales, :total_quantity => total_quantity}
    end
    return results
  end
end
