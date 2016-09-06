class ProductDate < ApplicationRecord
  belongs_to :report ,inverse_of: :product_dates 
end


