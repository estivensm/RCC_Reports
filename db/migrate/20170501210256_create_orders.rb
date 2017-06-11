class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.date :fecha_pedido
      t.integer :customer_id
      t.integer :user_id
      t.text :comentarios

      t.timestamps
    end
  end
end
