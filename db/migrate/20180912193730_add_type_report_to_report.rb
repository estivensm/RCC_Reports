class AddTypeReportToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :type_report, :string
  end
end
