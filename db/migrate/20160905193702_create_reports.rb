class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :count
      t.string :code
      t.string :autor
      t.string :product_name
      t.date :customer_report_date
      t.date :report_start_date
      t.references :plant, foreign_key: true
      t.string :title
      t.float :value
      t.float :decitex
      t.float :denier
      t.references :yarn_type, foreign_key: true
      t.references :merge, foreign_key: true
      t.references :filament_count, foreign_key: true
      t.string :segment
      t.string :customer_end_use
      t.string :invoice_invista
      t.string :invoice_mag
      t.float :quantity_shipped
      t.float :quantity_affected
      t.float :return_potential
      t.float :return_value
      t.float :claim_potential
      t.float :claim_value
      t.references :customer, foreign_key: true
      t.string :reporter
      t.string :phone
      t.string :email
      t.string :source
      t.references :specific_problem, foreign_key: true
      t.text :description_problem
      t.text :preliminary_investigation
      t.text :preliminary_conclusions
      t.text :research_results
      t.text :conclusions_plant
      t.text :action_plan
      t.boolean :close_claim
      t.date :date_close
      t.text :validation_claim

      t.timestamps
    end
  end
end
