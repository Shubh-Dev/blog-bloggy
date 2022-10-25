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

  describe 'GET /show' do
    it 'renders the :show template' do
      get user_path(1)
      expect(response).to render_template(:show)
    end

    it 'returns the status :ok' do
      get user_path(1)
      expect(response).to have_http_status(:ok)
    end
  end
end
