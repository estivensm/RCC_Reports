# == Schema Information
#
# Table name: product_dates
#
#  id         :integer          not null, primary key
#  number     :integer
#  date       :date
#  report_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_product_dates_on_report_id  (report_id)
#

require 'test_helper'

class ProductDateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
