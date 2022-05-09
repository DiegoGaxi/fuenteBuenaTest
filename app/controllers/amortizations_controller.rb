class AmortizationsController < ApplicationController

  # GET /amortizations or /amortizations.json
  def index
    @amortizations = Amortization.all
  end

end
