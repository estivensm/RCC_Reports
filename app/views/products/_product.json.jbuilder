json.extract! product, :id, :nombre, :titulo, :tipo, :merge, :medida, :hilos, :carretes, :created_at, :updated_at
json.url product_url(product, format: :json)