require 'rails_helper'

RSpec.describe 'Feature User login', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  it 'shows Email' do
    expect(page).to have_selector('input[type = email]')
    expect(page).to have_content('Email')
  end

  it 'shows Password  ' do
    expect(page).to have_selector('input[type = password]')
    expect(page).to have_field('Password')
    expect(page).to have_content('Password')
  end

  it 'shows button submit' do
    expect(page).to have_selector('input[type=submit]')
    expect(page).to have_button('Log in')
  end

  it 'Show error when submit with Empty fields' do
    fill_in 'Email', with: ' '
    fill_in 'Password', with: ' '
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

  it 'Show error when submit with wrong fields values' do
    fill_in 'Email', with: 'wrong'
    fill_in 'Password', with: 'wrong'
    click_button 'Log in'
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Invalid Email or password.')
  end

  it 'Login with correct fields values' do
    user = User.create!(name: 'Jonyole', email: 'e@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_current_path("/users/#{user.id}")
    expect(page).to have_content('Signed in successfully.')
  end
end
