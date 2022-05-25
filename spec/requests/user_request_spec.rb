require 'rails_helper'

RSpec.describe 'User request', type: :request do
  context 'User/index' do
    before(:example) { get users_path }

    it 'User page success' do
      expect(response).to have_http_status(:ok)
    end

    it 'User page render template' do
      expect(response).to render_template('users/index')
    end

    it 'User page have content' do
      expect(response.body).to include('Budgeter Mk')
    end
  end
end
