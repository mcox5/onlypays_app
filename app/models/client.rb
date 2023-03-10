class Client < ApplicationRecord
  has_many :sales
  has_many :sales_products, through: :sales
end
