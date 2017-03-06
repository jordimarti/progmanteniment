json.extract! operacio, :id, :edifici_id, :fase_id, :descripcio, :import_obres, :import_honoraris, :import_taxes, :import_altres, :import_total, :created_at, :updated_at
json.url operacio_url(operacio, format: :json)
