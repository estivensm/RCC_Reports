# == Schema Information
#
# Table name: filament_counts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FilamentCount < ApplicationRecord
	has_many :reports
end
