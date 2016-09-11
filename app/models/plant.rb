# == Schema Information
#
# Table name: plants
#
#  id         :integer          not null, primary key
#  name       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plant < ApplicationRecord
	has_many :reports
end
