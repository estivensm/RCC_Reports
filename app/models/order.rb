# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  fecha_pedido :date
#  customer_id  :integer
#  user_id      :integer
#  comentarios  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Order < ApplicationRecord
	belongs_to :user
	has_many :pedidos , inverse_of: :order, dependent: :destroy
	accepts_nested_attributes_for :pedidos, :allow_destroy => true



end
