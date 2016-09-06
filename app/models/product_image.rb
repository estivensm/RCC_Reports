class ProductImage < ApplicationRecord
  belongs_to :report ,inverse_of: :product_images
  mount_uploader :image, ProductImageUploader
end
