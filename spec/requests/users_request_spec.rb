require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'returns the status :ok' do
      get users_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /users/:id' do
    let(:user) { create(:user) }

    it 'returns the status :ok' do
      get user_path(user)
      expect(response).to have_http_status(:ok)
    end

    it 'returns the status :not_found' do
      get user_path(0)
      expect(response).to have_http_status(:not_found)
    end

    it 'returns the status :not_found' do
      get user_path(-1)
      expect(response).to have_http_status(:not_found)
    end
  end
end
