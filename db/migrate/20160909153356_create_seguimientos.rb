class CreateSeguimientos < ActiveRecord::Migration[5.0]
  def change
    create_table :seguimientos do |t|
      t.string :attachment
      t.text :description
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
