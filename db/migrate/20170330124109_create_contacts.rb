class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :mobil
      t.string :cargo
      t.string :user_id
      t.string :customer_id

      t.timestamps
    end
  end
end
