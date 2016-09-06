class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :country
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
