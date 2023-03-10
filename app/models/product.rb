class Product < ApplicationRecord
  belongs_to :category
  has_many :sales_product
  has_many :sales, through: :sales_product
end
