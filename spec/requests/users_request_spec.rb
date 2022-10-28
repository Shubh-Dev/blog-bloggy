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
end
