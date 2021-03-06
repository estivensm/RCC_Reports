# == Schema Information
#
# Table name: reports
#
#  id                        :integer          not null, primary key
#  count                     :integer
#  code                      :string
#  autor                     :string
#  product_name              :string
#  customer_report_date      :date
#  report_start_date         :date
#  plant_id                  :integer
#  title                     :string
#  value                     :float
#  decitex                   :float
#  denier                    :float
#  yarn_type_id              :integer
#  merge_id                  :integer
#  filament_count_id         :integer
#  segment                   :string
#  customer_end_use          :string
#  invoice_invista           :string
#  invoice_mag               :string
#  quantity_shipped          :float
#  quantity_affected         :float
#  return_potential          :float
#  return_value              :float
#  claim_potential           :float
#  claim_value               :float
#  customer_id               :integer
#  reporter                  :string
#  phone                     :string
#  email                     :string
#  source                    :string
#  specific_problem_id       :integer
#  description_problem       :text
#  preliminary_investigation :text
#  preliminary_conclusions   :text
#  research_results          :text
#  conclusions_plant         :text
#  action_plan               :text
#  close_claim               :boolean
#  date_close                :date
#  validation_claim          :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  type_report               :string
#
# Indexes
#
#  index_reports_on_customer_id          (customer_id)
#  index_reports_on_filament_count_id    (filament_count_id)
#  index_reports_on_merge_id             (merge_id)
#  index_reports_on_plant_id             (plant_id)
#  index_reports_on_specific_problem_id  (specific_problem_id)
#  index_reports_on_yarn_type_id         (yarn_type_id)
#

class Report < ApplicationRecord
 
  before_create :insertar #inserta el count para generar el codigo
  
  belongs_to :plant, optional: true
  belongs_to :yarn_type , optional: true
  belongs_to :merge , optional: true
  belongs_to :filament_count , optional: true
  belongs_to :customer , optional: true
  belongs_to :specific_problem , optional: true
  has_many :product_images , inverse_of: :report, dependent: :destroy
  has_many :product_dates , inverse_of: :report, dependent: :destroy
  has_many :seguimientos , dependent: :destroy

  accepts_nested_attributes_for :product_dates, :allow_destroy => true #acepta atributos del modelo de product_dates

  accepts_nested_attributes_for :product_images , :allow_destroy => true#acepta atributos del modelo de product_imagenes

 scope :reports, -> {where(type_report: "rcc")}
 scope :developments, -> {where(type_report: "prestamos")}

def self.search(search, search1, search2 , search3, search4, search5, search6)

  search != "" ? (scope :product, -> { where(product_name: search) }) : (scope :product, -> { where.not(product_name: nil) })
  search1 != "" ? (scope :customer, -> { where(customer_id: search1) }) : (scope :customer, -> { where.not(customer_id: nil) })
  search2 != "" ? (scope :plant, -> { where(plant_id: search2) }) : (scope :plant, -> { where.not(plant_id: nil) })  
  search3 != "" ? (scope :reporter, -> { where("reporter like '%#{search3.downcase}%' or reporter like '%#{search3.upcase}%'  or reporter like '%#{search3.capitalize}%' ") }) : (scope :reporter, -> { where.not(id: nil) }) 

  search4 != "" ? (scope :merge_scope, -> { where(merge_id: search4) }) : (scope :merge_scope, -> { where.not(merge_id: nil) })
  search5 != "" ? (scope :yarn_type, -> { where(yarn_type_id: search5) }) : (scope :yarn_type, -> { where.not(yarn_type_id: nil) })
  search6 != "" ? (scope :filament_count, -> { where(filament_count_id: search6) }) : (scope :filament_count, -> { where.not(filament_count_id: nil) })

  product.customer.plant.reporter.yarn_type.filament_count.merge_scope

end


def self.search1(search, search1, search2 , search3, search4)

 search != "" ? (scope :product, -> { where(product_name: search) }) : (scope :product, -> { where.not(product_name: nil) })
 search1 != "" ? (scope :customer, -> { where(customer_id: search1) }) : (scope :customer, -> { where.not(customer_id: nil) })
 search2 != "" ? (scope :plant, -> { where(plant_id: search2) }) : (scope :plant, -> { where.not(plant_id: nil) })  
 search3 != "" ? (scope :reporter, -> { where("reporter like '%#{search3.downcase}%' or reporter like '%#{search3.upcase}%'  or reporter like '%#{search3.capitalize}%' ") }) : (scope :reporter, -> { where.not(id: nil) }) 
 search4 != "" ? (scope :merge_scope, -> { where(merge_id: search4) }) : (scope :merge_scope, -> { where.not(merge_id: nil) })


 product.customer.plant.reporter.merge_scope
    
    ## type_report
end





    
   def insertar
    @num = Report.maximum(:count)
    if @num != nil
        @num = @num + 1

    else
        @num = 1001
    end
    @ano = Time.now.year.to_s
    @ano = @ano.remove("20") 
    self.count = @num
    self.code= "#{@num}-#{@ano}-MAG-CO" 
    end
end



