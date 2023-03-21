class ClientesController < ApplicationController

  # Obtener el cliente simulado
  def getClienteMongo

    # Se obtiene el cliente 
    cliente = Cliente.new
    cliente.name = 'Diego Gaxiola Development'
    # Se obtiene el prestamo del cliente llamando a la base de datos PostgreSQL
    cliente.loans = Loan.all
    cliente.prestado = cliente.loans.sum(:principal)
    
    render json: cliente
  end

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end
end
