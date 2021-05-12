require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'create new user' do
    scenario 'should be successful' do
      visit new_user_registration_path
      within('form') do
        fill_in 'Name', with: 'diamond'
        fill_in 'Email', with: 'diamond@gmail.com'
        fill_in 'Password', with: 123_456_789
      end
      click_button 'Sign up'
      expect(current_path).to eq('/users')
    end

    scenario 'should fail' do
      visit new_user_registration_path
      within('form') do
        fill_in 'Name', with: 'diamond'
        fill_in 'Password', with: 123_456_789
      end
      click_button 'Sign up'
      expect(current_path).not_to eq('/')
    end
  end

  context 'user login' do
    scenario 'it should succesfully login' do
      visit new_user_session_path
        fill_in 'Email', with: 'diamond@gmail.com'
        fill_in 'Password', with: 123456789
      click_on 'Log in'
      expect(current_path).to eq('/')
    end

    scenario 'it should not fail to login' do
      visit new_user_session_path
      fill_in 'Email', with: 'diamond'
      fill_in 'Password', with: 123456789
      click_on 'Log in'
      expect(current_path).to eq('/users/sign_in')
    end
  end
  
  context 'log out' do
    scenario 'Log Out' do
      visit new_user_session_path
      fill_in 'Email', with:'diamond@gmail.com'
      fill_in 'Password', with: 123456789
      click_on 'Log in'
      visit root_path
      expect(page).to have_content('Log Out')
    end
  end

end
