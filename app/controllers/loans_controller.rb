class LoansController < ApplicationController
  # before_action :set_loan, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  # # GET /loans/1 or /loans/1.json
  # def show
  # end

  def getPrestamo
    success = false
    principal = params[:principal].to_i
    interes = params[:interes].to_f
    plazo = params[:plazo].to_i
    
    @loan = FinanceMath::Loan.new(nominal_rate: interes, duration: plazo, amount: principal, structure_fee: 0, currency_protection: 0, fee: 0)
    
    monto_capital = @loan.principal
    pago_capital = @loan.principal / @loan.duration
    pago_capital_con_intereses = @loan.pmt
    pago_intereses = pago_capital_con_intereses - pago_capital
    monto_acumulado = 0
    monto_acumulado_con_intereses = 0
    
    monto_final_prestamo = pago_capital_con_intereses * @loan.duration
    
    message = "Pago periódico: $#{pago_capital_con_intereses.to_i}" + " | Intereses Totales: $#{(pago_intereses * @loan.duration.to_i).to_i} " + "| Monto Final: $#{monto_final_prestamo.to_i}";
    
    @amortizacion = []

    (1..@loan.duration.to_i).each do |i|
      monto_acumulado += pago_capital
      saldo_insoluto = monto_capital - monto_acumulado
      monto_acumulado_con_intereses += pago_capital_con_intereses
      
      @amortizacion << {
        no_pago: i,
        saldo_insoluto:(saldo_insoluto),
        interes: pago_intereses.to_i,
        iva: (pago_intereses * 0.16).to_i,
        pago_capital: pago_capital,
        pago_capital_con_intereses: pago_capital_con_intereses.to_i,
        capital: pago_capital,
        fecha: (Date.today + (i.month)).strftime("%d/%m/%Y"),
        monto_acumulado: monto_acumulado,
        monto_acumulado_con_intereses: monto_acumulado_con_intereses,
      }
    end
        render json: { 
        loan:@loan,
        pmt: @loan.pmt,
        apr:@loan.apr, 
        amortizacion:@amortizacion, 
        message:message 
        } 
  end

  def guardarPrestamo
    ActiveRecord::Base.transaction do
      success = false
      @loan = Loan.new()
      @loan.principal = params[:loan][:principal]
      @loan.interes = params[:loan][:nominal_rate]
      @loan.plazo = params[:loan][:duration]
      @loan.client_id = params[:client_id]

      if @loan.save
        params[:amortizacion].each do |amortizacion|
          @amortizacion = Amortization.new()
          @amortizacion.loan_id = @loan.id
          @amortizacion.no_pago = amortizacion[:no_pago]
          @amortizacion.iva = amortizacion[:iva]
          @amortizacion.saldo_insoluto = amortizacion[:saldo_insoluto]
          @amortizacion.monto_interes = amortizacion[:interes]
          @amortizacion.pago_capital = amortizacion[:capital]
          @amortizacion.pago_capital_con_intereses = amortizacion[:pago_capital_con_intereses]
          @amortizacion.fecha = amortizacion[:fecha]
          @amortizacion.save
        end
        success = true
      end
      render json: { success:success }
    end 
  end

  # # GET /loans/new
  # def new
  #   @loan = Loan.new
  # end

  # # GET /loans/1/edit
  # def edit
  # end

  # # POST /loans or /loans.json
  # def create
  #   @loan = Loan.new(loan_params)

  #   respond_to do |format|
  #     if @loan.save
  #       format.html { redirect_to loan_url(@loan), notice: "Loan was successfully created." }
  #       format.json { render :show, status: :created, location: @loan }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @loan.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /loans/1 or /loans/1.json
  # def update
  #   respond_to do |format|
  #     if @loan.update(loan_params)
  #       format.html { redirect_to loan_url(@loan), notice: "Loan was successfully updated." }
  #       format.json { render :show, status: :ok, location: @loan }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @loan.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /loans/1 or /loans/1.json
  # def destroy
  #   @loan.destroy

  #   respond_to do |format|
  #     format.html { redirect_to loans_url, notice: "Loan was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def loan_params
      params.require(:loan).permit(:principal, :interes, :plazo, :client_id)
    end
end
