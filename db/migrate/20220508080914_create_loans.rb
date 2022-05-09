class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :principal, :precision=>64, :scale=>12
      t.float :interes
      t.integer :plazo
      t.integer :cliente_id

      t.timestamps
    end
  end
end
