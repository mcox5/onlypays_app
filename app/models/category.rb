class Category < ApplicationRecord
  has_many :products
  has_many :sales_product, through: :product
end
