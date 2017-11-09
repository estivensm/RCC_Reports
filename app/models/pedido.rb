# == Schema Information
#
# Table name: pedidos
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  product_id         :integer
#  fecha_entrega      :date
#  fecha_ingreso_inv  :date
#  fecha_pedido       :date
#  fecha_entrega_real :date
#  estado_entrega     :string
#  estado             :boolean
#  contador           :integer
#  codigo             :string
#  contador_entrega   :integer
#  cantidad           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  customer_id        :string
#  order_id           :integer
#  ano                :integer
#  mes                :integer
#  dia                :integer
#

class Pedido < ApplicationRecord
	belongs_to :product
	belongs_to :user
    belongs_to :customer
    belongs_to :order ,inverse_of: :pedidos
    before_save :ingresar_fecha
    after_create :crear_fecha


    def crear_fecha

        @times = self.fecha_entrega.to_time
        @time =  @times.to_i - Time.now.to_i  
        self.contador_entrega = (@time / 60 / 60/ 24) + 1
        save
          
    end

    def ingresar_fecha

    
    self.ano = self.fecha_entrega.strftime("%Y") #Año
    self.dia = self.fecha_entrega.strftime("%d") #Dia del mes
    self.mes = self.fecha_entrega.strftime("%m") # Mes del Año

    end

end
