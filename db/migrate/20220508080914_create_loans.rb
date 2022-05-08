class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :principal, :precision=>64, :scale=>12
      t.float :interes
      t.integer :plazo
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
