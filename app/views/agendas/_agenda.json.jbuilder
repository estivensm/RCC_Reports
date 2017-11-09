json.extract! agenda, :id, :nombre, :empresa, :cargo, :telefono, :celular, :email, :direccion_empresa, :created_at, :updated_at
json.url agenda_url(agenda, format: :json)