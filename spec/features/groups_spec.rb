require 'rails_helper'

RSpec.feature "Groups", type: :feature do
  let(:user) { User.create(name: 'diamond', email: 'diamond@gmail.com', password: '123456789') }

  scenario 'Group should be succesfully created' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log in'
    click_on 'Categories'
    click_on 'New Category'
    fill_in 'group[name]', with: 'drinks'
    fill_in 'group[icon]', with: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSPCBha3upDGeAlNFGFUt9BOnZzdMlZu1elFJ6qeDAt-Y2W_pRE8FHa063nfdAYUzIWYU&usqp=CAU'
    click_on 'Save Category'
    expect(page).to have_content('drinks')
  end

  scenario 'Group should not be succesfully created' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'Log in'
    click_on 'Categories'
    click_on 'New Category'
    fill_in 'group[name]', with: ''
    fill_in 'group[icon]', with: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSPCBha3upDGeAlNFGFUt9BOnZzdMlZu1elFJ6qeDAt-Y2W_pRE8FHa063nfdAYUzIWYU&usqp=CAU'
    click_on 'Save Category'
    expect(page).to have_content("Name can't be blank")
  end

end
