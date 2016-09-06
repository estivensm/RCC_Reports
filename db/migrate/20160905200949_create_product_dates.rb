class CreateProductDates < ActiveRecord::Migration[5.0]
  def change
    create_table :product_dates do |t|
      t.integer :number
      t.date :date
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
