# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string
#  country    :string
#  address    :string
#  city       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
	has_many :reports
	has_many :pedidos
	has_many :contacts, inverse_of: :customer, dependent: :destroy
	accepts_nested_attributes_for :contacts, :allow_destroy => true

end
