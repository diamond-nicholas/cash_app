require "application_system_test_case"

class GroupedPaymentsTest < ApplicationSystemTestCase
  setup do
    @grouped_payment = grouped_payments(:one)
  end

  test "visiting the index" do
    visit grouped_payments_url
    assert_selector "h1", text: "Grouped Payments"
  end

  test "creating a Grouped payment" do
    visit grouped_payments_url
    click_on "New Grouped Payment"

    fill_in "Deposit", with: @grouped_payment.deposit_id
    fill_in "Group", with: @grouped_payment.group_id
    click_on "Create Grouped payment"

    assert_text "Grouped payment was successfully created"
    click_on "Back"
  end

  test "updating a Grouped payment" do
    visit grouped_payments_url
    click_on "Edit", match: :first

    fill_in "Deposit", with: @grouped_payment.deposit_id
    fill_in "Group", with: @grouped_payment.group_id
    click_on "Update Grouped payment"

    assert_text "Grouped payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Grouped payment" do
    visit grouped_payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grouped payment was successfully destroyed"
  end
end
