class AddOrderToPedido < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :order_id, :integer
  end
end
