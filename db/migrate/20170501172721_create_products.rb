class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :titulo
      t.string :tipo
      t.string :merge
      t.string :medida
      t.string :hilos
      t.string :carretes
      t.integer :user_id

      t.timestamps
    end
  end
end
