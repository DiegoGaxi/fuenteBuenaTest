json.extract! loan, :id, :principal, :interes, :plazo, :cliente_id, :created_at, :updated_at
json.url loan_url(loan, format: :json)
