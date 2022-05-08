require "test_helper"

class AmortizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amortization = amortizations(:one)
  end

  test "should get index" do
    get amortizations_url
    assert_response :success
  end

  test "should get new" do
    get new_amortization_url
    assert_response :success
  end

  test "should create amortization" do
    assert_difference('Amortization.count') do
      post amortizations_url, params: { amortization: { fecha: @amortization.fecha, iva: @amortization.iva, loan_id: @amortization.loan_id, monto_interes: @amortization.monto_interes, no_pago: @amortization.no_pago, pago_capital: @amortization.pago_capital, pago_capital_con_intereses: @amortization.pago_capital_con_intereses, saldo_insoluto: @amortization.saldo_insoluto } }
    end

    assert_redirected_to amortization_url(Amortization.last)
  end

  test "should show amortization" do
    get amortization_url(@amortization)
    assert_response :success
  end

  test "should get edit" do
    get edit_amortization_url(@amortization)
    assert_response :success
  end

  test "should update amortization" do
    patch amortization_url(@amortization), params: { amortization: { fecha: @amortization.fecha, iva: @amortization.iva, loan_id: @amortization.loan_id, monto_interes: @amortization.monto_interes, no_pago: @amortization.no_pago, pago_capital: @amortization.pago_capital, pago_capital_con_intereses: @amortization.pago_capital_con_intereses, saldo_insoluto: @amortization.saldo_insoluto } }
    assert_redirected_to amortization_url(@amortization)
  end

  test "should destroy amortization" do
    assert_difference('Amortization.count', -1) do
      delete amortization_url(@amortization)
    end

    assert_redirected_to amortizations_url
  end
end
