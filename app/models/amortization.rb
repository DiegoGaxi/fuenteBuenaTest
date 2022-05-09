class Amortization < ApplicationRecord
  belongs_to :loan

  validates_presence_of :no_pago, :saldo_insoluto, :monto_interes,:iva, :pago_capital, :pago_capital_con_intereses ,:fecha , :loan_id

  def guardarAmortizaciones(loan,amortizaciones)
    ActiveRecord::Base.transaction do
      success = false
        amortizaciones.each do |amortizacion|
          @amortizacion = Amortization.new()
          @amortizacion.loan_id = loan.id
          @amortizacion.no_pago = amortizacion[:no_pago]
          @amortizacion.iva = amortizacion[:iva]
          @amortizacion.saldo_insoluto = amortizacion[:saldo_insoluto]
          @amortizacion.monto_interes = amortizacion[:interes]
          @amortizacion.pago_capital = amortizacion[:capital]
          @amortizacion.pago_capital_con_intereses = amortizacion[:pago_capital_con_intereses]
          @amortizacion.fecha = amortizacion[:fecha]
           if @amortizacion.save
            success = true
          end
        end
      return success
    end
  end

end
