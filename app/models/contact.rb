# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  name        :string
#  email       :string
#  mobil       :string
#  cargo       :string
#  user_id     :string
#  customer_id :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Contact < ApplicationRecord
	belongs_to :customer , inverse_of: :contacts
end
