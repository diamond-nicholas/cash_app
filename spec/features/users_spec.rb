require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  let(:user) { User.create(name: 'diamond', email: 'diamond@gmail.com', password: '123456789') }
  context 'create new user' do
    scenario 'should be successful' do
      visit new_user_registration_path
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign up'
      expect(current_path).to eq('/users')
    end

    scenario 'should fail' do
      visit new_user_registration_path
      fill_in 'Name', with: user.name
      fill_in 'Password', with: user.password
      click_button 'Sign up'
      expect(current_path).not_to eq('/')
    end
  end

  context 'user login' do
    scenario 'it should succesfully login' do
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      expect(current_path).to eq('/')
    end
  end
end
