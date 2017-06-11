# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  nombre     :string
#  titulo     :string
#  tipo       :string
#  merge      :string
#  medida     :string
#  hilos      :string
#  carretes   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
        has_many :pedidos
        belongs_to :user
    
        



	def self.import(file ,user_id)
   spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    product = find_by(id: row["id"]) || new
    product.attributes = row.to_hash
    product.user_id = user_id
    product.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end
end
