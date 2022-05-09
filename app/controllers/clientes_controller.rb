class ClientesController < ApplicationController

  def getClienteMongo
    @client = Cliente.where(id: 1).first
    cliente = @client.attributes
    cliente[:loans] = Loan.where(cliente_id: 1)
    cliente[:prestado] = cliente[:loans].sum(:principal)
    render json: cliente
  end

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end

end
