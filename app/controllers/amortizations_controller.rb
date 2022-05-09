class AmortizationsController < ApplicationController
  # before_action :set_amortization, only: %i[ show edit update destroy ]

  # GET /amortizations or /amortizations.json
  def index
    @amortizations = Amortization.all
  end

  # # GET /amortizations/1 or /amortizations/1.json
  # def show
  # end

  # # GET /amortizations/new
  # def new
  #   @amortization = Amortization.new
  # end

  # # GET /amortizations/1/edit
  # def edit
  # end

  # # POST /amortizations or /amortizations.json
  # def create
  #   @amortization = Amortization.new(amortization_params)

  #   respond_to do |format|
  #     if @amortization.save
  #       format.html { redirect_to amortization_url(@amortization), notice: "Amortization was successfully created." }
  #       format.json { render :show, status: :created, location: @amortization }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @amortization.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /amortizations/1 or /amortizations/1.json
  # def update
  #   respond_to do |format|
  #     if @amortization.update(amortization_params)
  #       format.html { redirect_to amortization_url(@amortization), notice: "Amortization was successfully updated." }
  #       format.json { render :show, status: :ok, location: @amortization }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @amortization.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /amortizations/1 or /amortizations/1.json
  # def destroy
  #   @amortization.destroy

  #   respond_to do |format|
  #     format.html { redirect_to amortizations_url, notice: "Amortization was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amortization
      @amortization = Amortization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def amortization_params
      params.require(:amortization).permit(:loan_id, :no_pago, :saldo_insoluto, :iva, :pago_capital, :pago_capital_con_intereses, :monto_interes, :fecha)
    end
end
