class Sale < ApplicationRecord
  belongs_to :client
  has_many :sales_product
  has_many :products, through: :sales_product
end
