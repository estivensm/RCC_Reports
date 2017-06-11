# == Schema Information
#
# Table name: product_images
#
#  id          :integer          not null, primary key
#  number      :integer
#  image       :string
#  description :text
#  report_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_product_images_on_report_id  (report_id)
#

require 'test_helper'

class ProductImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
