require "test_helper"

class GroupedPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grouped_payment = grouped_payments(:one)
  end

  test "should get index" do
    get grouped_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_grouped_payment_url
    assert_response :success
  end

  test "should create grouped_payment" do
    assert_difference('GroupedPayment.count') do
      post grouped_payments_url, params: { grouped_payment: { deposit_id: @grouped_payment.deposit_id, group_id: @grouped_payment.group_id } }
    end

    assert_redirected_to grouped_payment_url(GroupedPayment.last)
  end

  test "should show grouped_payment" do
    get grouped_payment_url(@grouped_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_grouped_payment_url(@grouped_payment)
    assert_response :success
  end

  test "should update grouped_payment" do
    patch grouped_payment_url(@grouped_payment), params: { grouped_payment: { deposit_id: @grouped_payment.deposit_id, group_id: @grouped_payment.group_id } }
    assert_redirected_to grouped_payment_url(@grouped_payment)
  end

  test "should destroy grouped_payment" do
    assert_difference('GroupedPayment.count', -1) do
      delete grouped_payment_url(@grouped_payment)
    end

    assert_redirected_to grouped_payments_url
  end
end
