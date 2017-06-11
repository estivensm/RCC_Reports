namespace :email do
  desc "Sends the most voted products created yesterday"
  task vencimiento: :environment do
    #pedidoMailer.noty_pedido(Employed.last, pedido.first).deliver_now
    Pedido.all.each do |pedido|
        
            
        times = pedido.fecha_entrega.to_time
        time =  times.to_i - Time.now.to_i
        pedido.contador_entrega = (time / 60 / 60/ 24) + 1

            if pedido.contador_entrega < 5 && pedido.contador_entrega > 0
            
            AlertMailer.vencimiento_pedido(pedido, "proximo").deliver
            
        elsif pedido.contador_entrega < 0

            AlertMailer.vencimiento_pedido(pedido, "vencido").deliver

        elsif pedido.contador_entrega == 0

            AlertMailer.vencimiento_pedido(pedido, "hoy").deliver

        end

     end
  end
end



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