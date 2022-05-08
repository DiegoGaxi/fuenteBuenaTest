class CreateAmortizations < ActiveRecord::Migration[6.1]
  def change
    create_table :amortizations do |t|
      t.references :loan, null: false, foreign_key: true
      t.integer :no_pago
      t.decimal :saldo_insoluto, :precision=>64, :scale=>12
      t.float :iva
      t.decimal :pago_capital, :precision=>64, :scale=>12
      t.decimal :pago_capital_con_intereses, :precision=>64, :scale=>12
      t.float :monto_interes
      t.date :fecha

      t.timestamps
    end
  end
end
