require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:two)
  end

  # test "should get index" do
  #   get loans_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_loan_url
  #   assert_response :success
  # end

  # test "should create loan" do
  #   assert_difference('Loan.count') do
  #     @loan = Loan.new(@loan)
  #   end
  #   assert_response :success
  # end

  # test "should show loan" do
  #   get loan_url(@loan)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_loan_url(@loan)
  #   assert_response :success
  # end

  # test "should update loan" do
  #   patch loan_url(@loan), params: { loan: { client_id: @loan.client_id, interes: @loan.interes, plazo: @loan.plazo, principal: @loan.principal } }
  #   assert_redirected_to loan_url(@loan)
  # end

  # test "should destroy loan" do
  #   assert_difference('Loan.count', -1) do
  #     delete loan_url(@loan)
  #   end

  #   assert_redirected_to loans_url
  # end
end
