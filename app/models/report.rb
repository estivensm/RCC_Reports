class Report < ApplicationRecord
 
  before_create :insertar #inserta el count para generar el codigo

  belongs_to :plant
  belongs_to :yarn_type
  belongs_to :merge
  belongs_to :filament_count
  belongs_to :customer
  belongs_to :specific_problem
  has_many :product_images , inverse_of: :report, dependent: :destroy
  has_many :product_dates , inverse_of: :report, dependent: :destroy
    
  accepts_nested_attributes_for :product_dates #acepta atributos del modelo de product_dates

  accepts_nested_attributes_for :product_images #acepta atributos del modelo de product_imagenes
    
 
    
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



