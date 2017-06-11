class AddCustomerToPedido < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :customer_id, :string
  end
end
