# == Schema Information
#
# Table name: tracings
#
#  id          :integer          not null, primary key
#  attachment  :string
#  description :text
#  reports_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_tracings_on_reports_id  (reports_id)
#

class Tracing < ApplicationRecord
  belongs_to :report
end
