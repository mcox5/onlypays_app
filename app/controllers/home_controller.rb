class HomeController < ApplicationController
  def index
    @sales_per_category = sales_per_category

    @order_products = order_products_by_sales(Product.all, 3)
    raise

  end

  private

  # Vamos a recorrer las ventas por categoría de manera que nos retorne un hash con los resultados
  def sales_per_category
    results = {}
    Category.all.each do |category|
      category_sales = category.sales_product.reject { |sale_product| Sale.find(sale_product.sale_id).status != 0 }
      total_sales = category_sales.map(&:sale_id).uniq.size
      total_quantity = category_sales.sum(&:quantity)
      results[category] = { :total_sales => total_sales, :total_quantity => total_quantity }
    end
    return results
  end
  # Método que analiza cuantas ventas tuvo determinado producto, según su id

  # def valid_sale?(sale_id)
  #   sale = Sale.find(sale_id)
  #   return true if sale.status.zero?

  #   false
  # end

  def product_total_sales(id)
    product = Product.find(id)
    product_sales = product.sales_product.reject { |sale_product|  Sale.find(sale_product.sale_id).status != 0 }
    product_sales_quantity = product_sales.inject(0) { |sum, sale_product| sum + sale_product.quantity }
    return { :product_name => product.name, :total_sales => product_sales_quantity}
  end

  # Método que ordena los productos y retorna los primeros "n" y los últimos "n"
  def order_products_by_sales(products, n)
    array_of_sales = []
    products.each do |product|
      array_of_sales.push(product_total_sales(product.id))
    end
    sorted_products = array_of_sales.sort_by { |hash| -hash[:total_sales] }
    return { :best_products => sorted_products.first(n), :worst_products => sorted_products.last(n) }
  end
end
