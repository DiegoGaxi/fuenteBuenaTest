class Loan < ApplicationRecord
  # belongs_to :cliente
  has_many :amortizations

  validates_presence_of :principal, :interes, :plazo, :cliente_id
end
