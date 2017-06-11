# == Schema Information
#
# Table name: pedidos
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  product_id         :integer
#  fecha_entrega      :date
#  fecha_ingreso_inv  :date
#  fecha_pedido       :date
#  fecha_entrega_real :date
#  estado_entrega     :string
#  estado             :boolean
#  contador           :integer
#  codigo             :string
#  contador_entrega   :integer
#  cantidad           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  customer_id        :string
#  order_id           :integer
#

require 'test_helper'

class PedidoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
