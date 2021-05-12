require 'rails_helper'

RSpec.feature 'Deposits', type: :feature do
  let(:user) { User.create(name: 'diamond', email: 'diamond@gmail.com', password: '123456789') }

  scenario 'Deposit should be succesfully created' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log in'
    click_on 'All My Expenses'
    click_on 'Add Expense'
    fill_in 'deposit[name]', with: 'cheese'
    fill_in 'deposit[amount]', with: 500
    click_on 'Save Expense'
    expect(page).to have_content('cheese')
  end

  scenario 'Deposit should not save' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log in'
    click_on 'All My Expenses'
    click_on 'Add Expense'
    fill_in 'deposit[name]', with: ''
    fill_in 'deposit[amount]', with: 500
    click_on 'Save Expense'
    expect(page).to have_content("Name can't be blank")
  end
end
