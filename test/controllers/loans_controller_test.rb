require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "loan is not created without principal" do
    loan = Loan.new
    loan.interes = 0.1
    loan.plazo = 12
    loan.client = clients(:one)
    assert_not loan.save
  end

  test "loan is not created without interest" do
    loan = Loan.new
    loan.principal = 500
    loan.plazo = 12
    loan.client = clients(:one)
    assert_not loan.save
  end

  test "loan is not created without plazo" do
    loan = Loan.new
    loan.principal = 500
    loan.interes = 0.1
    loan.client = clients(:one)
    assert_not loan.save
  end

  test "loan is not created without client" do
    loan = Loan.new
    loan.principal = 500
    loan.interes = 0.1
    loan.plazo = 12
    assert_not loan.save
  end

  test "should get index" do
    get loans_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_url
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post loans_url, params: { loan: { client_id: @loan.client_id, interes: @loan.interes, plazo: @loan.plazo, principal: @loan.principal } }
    end

    assert_redirected_to loan_url(Loan.last)
  end

  test "should show loan" do
    get loan_url(@loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test "should update loan" do
    patch loan_url(@loan), params: { loan: { client_id: @loan.client_id, interes: @loan.interes, plazo: @loan.plazo, principal: @loan.principal } }
    assert_redirected_to loan_url(@loan)
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end
