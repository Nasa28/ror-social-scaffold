require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:user) { User.new(name: 'Chinasa', email: 'chinasa@gmail.com', password: '123456') }
  let(:my_user) { User.create(name: 'Chinasa', email: 'chinasa@gmail.com', password: '123456') }

  context 'sign up:' do
    scenario 'sign up succesfully' do
      visit new_user_registration_path
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_on 'Sign up'
      visit root_path
      expect(page).to have_content('Sign out')
    end

    scenario 'unsuccesfully sign up' do
      visit new_user_registration_path
      fill_in 'Name', with: user.name
      fill_in 'Email', with: ''
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_on 'Sign up'
      visit root_path
      expect(page).to_not have_content('Sign out')
    end
  end

  context 'loging in:' do
    scenario 'succesfully log in' do
      visit new_user_session_path
      fill_in 'Email', with: my_user.email
      fill_in 'Password', with: my_user.password
      click_on 'Log in'
      expect(page).to have_content('Signed in successfully')
    end
    scenario 'unsuccesfully log in' do
      visit new_user_session_path
      fill_in 'Email', with: ''
      fill_in 'Password', with: my_user.password
      click_on 'Log in'
      expect(page).to have_content('Invalid Email or password')
    end
  end
  context 'log out' do
    scenario 'Log Out' do
      visit new_user_session_path
      fill_in 'Email', with: my_user.email
      fill_in 'Password', with: my_user.password
      click_on 'Log in'
      click_on 'Sign out'
      visit root_path
      expect(page).to have_content('sign in')
    end
  end
  
end
