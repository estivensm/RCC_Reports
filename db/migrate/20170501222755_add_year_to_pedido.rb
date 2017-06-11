class AddYearToPedido < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :ano, :integer
    add_column :pedidos, :mes, :integer
    add_column :pedidos, :dia, :integer
  end
end
