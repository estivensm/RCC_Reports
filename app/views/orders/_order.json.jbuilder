json.extract! order, :id, :fecha_pedido, :customer_id, :user_id, :comentarios, :created_at, :updated_at
json.url order_url(order, format: :json)