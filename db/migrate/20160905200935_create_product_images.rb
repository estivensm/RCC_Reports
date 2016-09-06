class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.integer :number
      t.string :image
      t.text :description
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
