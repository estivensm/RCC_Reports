class CreateAgendas < ActiveRecord::Migration[5.0]
  def change
    create_table :agendas do |t|
      t.string :nombre
      t.string :empresa
      t.string :cargo
      t.string :telefono
      t.string :celular
      t.string :email
      t.string :direccion_empresa

      t.timestamps
    end
  end
end
