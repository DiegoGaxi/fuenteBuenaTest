json.extract! loan, :id, :principal, :interes, :plazo, :client_id, :created_at, :updated_at
json.url loan_url(loan, format: :json)
