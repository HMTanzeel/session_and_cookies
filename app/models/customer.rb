class Customer < ApplicationRecord
  has_many :orders
  has_many :reviews
  self.locking_column= :loc_customer_column
  
end
