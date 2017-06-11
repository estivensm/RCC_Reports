# == Schema Information
#
# Table name: seguimientos
#
#  id          :integer          not null, primary key
#  attachment  :string
#  description :text
#  report_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_seguimientos_on_report_id  (report_id)
#

require 'test_helper'

class SeguimientoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
