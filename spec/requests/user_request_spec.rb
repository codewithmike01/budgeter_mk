require 'rails_helper'

RSpec.describe 'User request', type: :request do
  context 'Home' do
    before(:example) { get root_path }

    it 'Home page success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Home page render template' do
      expect(response).to render_template('homes/index')
    end

    it 'Home page have content' do
      expect(response.body).to include('Budgeter Mk')
    end
  end

  context 'User/show' do
    before(:example) do
      current_user = User.create!(name: 'Frank', email: 'obio@gmail.com', confirmed_at: Time.now, password: 'password')
      get user_path(current_user.id)
    end

    it 'Success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Home page render template' do
      expect(response).to render_template('users/show')
    end

    it 'Home page have content' do
      expect(response.body).to include('Add Category')
    end
  end
end
