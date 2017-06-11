class AlertMailer < ApplicationMailer
def vencimiento_pedido(pedido, tipo)
  #@employed = employed
  @pedido = pedido
 
  if tipo == "proximo"
    var = "esta proximo a vencer"
  elsif tipo == "vencido"
    var = "se ha vencido"
  else
    var = "vence hoy"
  end
   @var = var
  mail(to: "alejovelez10@gmail.com", subject: "El Pedido #{@pedido.codigo} #{var}")
end

end
