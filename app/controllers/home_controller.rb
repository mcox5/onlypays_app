class HomeController < ApplicationController
  def index
    @sales = sales_record.first(15)
    raise
    @client_sales = client_sales
    @order_products = order_products_by_sales(Product.all, 3)
    @sales_per_category = sales_per_category

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

  # Método para encontrar las ventas promedio de los clientes (CANTIDAD DE PRODUCTOS COMPRADOS/CANTIDAD DE VENTAS EN LOS QUE SE COMPRÓ (STATUS = 0))
  def client_sales
    clients_sales_result = []
    Client.all.each do |client|
      client_sales = client.sales_products.reject { |sale_product|  Sale.find(sale_product.sale_id).status != 0 }
      client_sales_quantity = client_sales.inject(0) { |sum, sale_product| sum + sale_product.quantity }
      client_effective_sales = client.sales.select { |sale| sale.status == 0}
      number_of_sales = client_effective_sales.size
      clients_sales_result.push({ :client => client.name, :average_of_sales => (client_sales_quantity / number_of_sales) })
    end
    return clients_sales_result
  end

  def sales_record
    sales = Sale.all.sort_by { |sale| sale.date}
    return sales
  end

end
