require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:user) { User.new(name: 'Chinasa', email: 'chinasa@gmail.com', password: '123456') }
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
  end
end
