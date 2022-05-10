class ClientesController < ApplicationController

  # Obtener el cliente simulado
  def getClienteMongo

    # Se obtiene el cliente llamando a la base de datos MongoDB
    @client = Cliente.where(id: 1).first
    cliente = @client.attributes

    # Se obtiene el prestamo del cliente llamando a la base de datos PostgreSQL
    cliente[:loans] = Loan.where(cliente_id: 1)
    cliente[:prestado] = cliente[:loans].sum(:principal)
    
    render json: cliente
  end

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end

end
