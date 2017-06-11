class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.integer :user_id
      t.integer :product_id
      t.date :fecha_entrega
      t.date :fecha_ingreso_inv
      t.date :fecha_pedido
      t.date :fecha_entrega_real
      t.string :estado_entrega
      t.boolean :estado
      t.integer :contador
      t.string :codigo
      t.integer :contador_entrega
      t.integer :cantidad

      t.timestamps
    end
  end
end
