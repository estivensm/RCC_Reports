# == Schema Information
#
# Table name: specific_problems
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SpecificProblem < ApplicationRecord
	has_many :reports
end
