# == Schema Information
#
# Table name: reports
#
#  id                        :integer          not null, primary key
#  count                     :integer
#  code                      :string
#  autor                     :string
#  product_name              :string
#  customer_report_date      :date
#  report_start_date         :date
#  plant_id                  :integer
#  title                     :string
#  value                     :float
#  decitex                   :float
#  denier                    :float
#  yarn_type_id              :integer
#  merge_id                  :integer
#  filament_count_id         :integer
#  segment                   :string
#  customer_end_use          :string
#  invoice_invista           :string
#  invoice_mag               :string
#  quantity_shipped          :float
#  quantity_affected         :float
#  return_potential          :float
#  return_value              :float
#  claim_potential           :float
#  claim_value               :float
#  customer_id               :integer
#  reporter                  :string
#  phone                     :string
#  email                     :string
#  source                    :string
#  specific_problem_id       :integer
#  description_problem       :text
#  preliminary_investigation :text
#  preliminary_conclusions   :text
#  research_results          :text
#  conclusions_plant         :text
#  action_plan               :text
#  close_claim               :boolean
#  date_close                :date
#  validation_claim          :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_reports_on_customer_id          (customer_id)
#  index_reports_on_filament_count_id    (filament_count_id)
#  index_reports_on_merge_id             (merge_id)
#  index_reports_on_plant_id             (plant_id)
#  index_reports_on_specific_problem_id  (specific_problem_id)
#  index_reports_on_yarn_type_id         (yarn_type_id)
#

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
