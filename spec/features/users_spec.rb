require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'create new user' do
    scenario "should be successful" do
      visit new_user_registration_path
      within('form') do
        fill_in 'Name', with: 'diamond'
        fill_in 'Email', with: 'diamond@gmail.com'
        fill_in 'Password', with: 123456789
      end
       click_button 'Sign up'
       expect(current_path).to eq('/users')
    end

    scenario "should fail" do
       visit new_user_registration_path
      within('form') do
        fill_in 'Name', with: 'diamond'
        fill_in 'Password', with: 123456789
      end
       click_button 'Sign up'
       expect(current_path).not_to eq('/')
    end
  end
end
