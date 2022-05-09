require "application_system_test_case"

class AmortizationsTest < ApplicationSystemTestCase
  setup do
    @amortization = amortizations(:one)
  end

  # test "visiting the index" do
  #   visit amortizations_url
  #   assert_selector "h1", text: "Amortizations"
  # end

  # test "creating a Amortization" do
  #   visit amortizations_url
  #   click_on "New Amortization"

  #   fill_in "Fecha", with: @amortization.fecha
  #   fill_in "Iva", with: @amortization.iva
  #   fill_in "Loan", with: @amortization.loan_id
  #   fill_in "Monto interes", with: @amortization.monto_interes
  #   fill_in "No pago", with: @amortization.no_pago
  #   fill_in "Pago capital", with: @amortization.pago_capital
  #   fill_in "Pago capital con intereses", with: @amortization.pago_capital_con_intereses
  #   fill_in "Saldo insoluto", with: @amortization.saldo_insoluto
  #   click_on "Create Amortization"

  #   assert_text "Amortization was successfully created"
  #   click_on "Back"
  # end

  # test "updating a Amortization" do
  #   visit amortizations_url
  #   click_on "Edit", match: :first

  #   fill_in "Fecha", with: @amortization.fecha
  #   fill_in "Iva", with: @amortization.iva
  #   fill_in "Loan", with: @amortization.loan_id
  #   fill_in "Monto interes", with: @amortization.monto_interes
  #   fill_in "No pago", with: @amortization.no_pago
  #   fill_in "Pago capital", with: @amortization.pago_capital
  #   fill_in "Pago capital con intereses", with: @amortization.pago_capital_con_intereses
  #   fill_in "Saldo insoluto", with: @amortization.saldo_insoluto
  #   click_on "Update Amortization"

  #   assert_text "Amortization was successfully updated"
  #   click_on "Back"
  # end

  # test "destroying a Amortization" do
  #   visit amortizations_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

  #   assert_text "Amortization was successfully destroyed"
  # end
end
