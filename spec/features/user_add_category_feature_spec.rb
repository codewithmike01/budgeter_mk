require 'rails_helper'

RSpec.describe 'Feature User login', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  it 'Add category' do
    user = User.create!(name: 'Jonyole', email: 'eii@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add Category'

    expect(page).to have_current_path("/users/#{user.id}/groups/new")
  end

  it 'Presence of Add category select field' do
    user = User.create!(name: 'Jonyole', email: 'eiiy@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add Category'

    expect(page).to have_content('Select a category')
  end

  it 'Presence of Add category name field' do
    user = User.create!(name: 'Jonyole', email: 'eiio@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add Category'

    expect(page).to have_content('Name')
  end

  it 'Presence of Add category button submit field' do
    user = User.create!(name: 'Jonyole', email: 'eiio@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add Category'

    expect(page).to have_button('Add category')
  end

  it 'Add a category to the list' do
    user = User.create!(name: 'Jonyole', email: 'eiio@gmail.com', confirmed_at: Time.now, password: 'password',
                        password_confirmation: 'password')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add Category'

    select 'Food', from: 'icon'
    fill_in 'Name', with: 'food dash'

    click_button 'Add category'

    expect(page).to have_content('Group created successfully')
    expect(page).to have_content('food dash')
  end
end
