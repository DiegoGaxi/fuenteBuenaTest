class LoansController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /loans or /loans.json
  def index
    @loans = Loan.all
  end

  def getPrestamo
    success = false
    principal = params[:principal].to_i
    interes = params[:interes].to_f
    plazo = params[:plazo].to_i

    @loan = FinanceMath::Loan.new(nominal_rate: interes, duration: plazo, amount: principal, structure_fee: 0, currency_protection: 0, fee: 0)

    monto_capital = @loan.principal.to_i
    pago_capital = (@loan.principal / @loan.duration)
    pago_capital_con_intereses = @loan.pmt.to_i
    pago_intereses = (pago_capital_con_intereses - pago_capital)
    monto_acumulado = 0
    monto_acumulado_con_intereses = 0

    monto_final_prestamo = (pago_capital_con_intereses * @loan.duration).to_i

    @amortizacion = []

    (1..@loan.duration.to_i).each do |i|
      monto_acumulado += pago_capital
      saldo_insoluto = monto_capital - monto_acumulado
      monto_acumulado_con_intereses += pago_capital_con_intereses

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

  def guardarPrestamo
    ActiveRecord::Base.transaction do
      success = false
      @loan = Loan.new()
      @loan.principal = params[:loan][:principal]
      @loan.interes = params[:loan][:nominal_rate]
      @loan.plazo = params[:loan][:duration]
      @loan.cliente_id = params[:cliente_id]

      if @loan.save
       if Amortization.new.guardarAmortizaciones(@loan, params[:amortizacion])
          success = true
        end
      end
      render json: { success:success }
    end
  end

end
