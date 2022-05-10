class LoansController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  def getPrestamo
    success = false
    # Se obtienen los parametros de la url del prestamo
    principal = params[:principal].to_i
    interes = params[:interes].to_f
    plazo = params[:plazo].to_i
    
    # Calculo el prestamo con FinanceMath::Loan
    @loan = FinanceMath::Loan.new(nominal_rate: interes, duration: plazo, amount: principal, structure_fee: 0, currency_protection: 0, fee: 0)
    
    # Calculos de Variables (formulas)
    monto_capital = @loan.principal.to_i
    pago_capital = (@loan.principal / @loan.duration)
    pago_capital_con_intereses = @loan.pmt.to_i
    pago_intereses = (pago_capital_con_intereses - pago_capital)
    monto_final_prestamo = (pago_capital_con_intereses * @loan.duration).to_i
    
    # Array que contendra las amortizaciones del prestamo
    @amortizacion = []
    monto_acumulado = 0
    monto_acumulado_con_intereses = 0

    # Ciclo para generar las amortizaciones
    (1..@loan.duration.to_i).each do |i|
      monto_acumulado += pago_capital
      saldo_insoluto = monto_capital - monto_acumulado
      monto_acumulado_con_intereses += pago_capital_con_intereses
      
      # Inserto Amortizaciones para el prestamo en el arreglo
      @amortizacion << {
        no_pago: i,
        saldo_insoluto:(saldo_insoluto.to_i),
        interes: pago_intereses.round,
        iva: (pago_intereses * 0.16).to_i,
        pago_capital: pago_capital.round,
        pago_capital_con_intereses: pago_capital_con_intereses.to_i,
        capital: pago_capital,
        fecha: (Date.today + (i.month)).strftime("%d/%m/%Y"),
        monto_acumulado: monto_acumulado,
        monto_acumulado_con_intereses: monto_acumulado_con_intereses,
      }
    end

    # Retorno el resultado de la transaccion
        render json: {
        loan:@loan,
        amortizacion:@amortizacion,
        apr:@loan.apr,
        pmt:@loan.pmt,
        pago_capital_con_intereses:pago_capital_con_intereses,
        intereses_totales:(pago_intereses * @loan.duration),
        monto_final_prestamo:monto_final_prestamo,
        }
  end

  # Guarda el prestamo en la base de datos
  def guardarPrestamo
    ActiveRecord::Base.transaction do
      success = false
      @loan = Loan.new()
      @loan.principal = params[:loan][:principal]
      @loan.interes = params[:loan][:nominal_rate]
      @loan.plazo = params[:loan][:duration]
      @loan.cliente_id = params[:cliente_id]

      if @loan.save
        # Guardo las amortizaciones llamando al modelo Amortizacion
       if Amortization.new.guardarAmortizaciones(@loan, params[:amortizacion])
          success = true
        end
      end
      # Si todo salio bien, se retorna true
      render json: { success:success }
    end
  end

end
