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

  describe 'GET#show' do
    let(:user) do
      User.create(
        name: 'John',
        photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
        bio: 'I am a software developer'
      )
    end
    before(:example) { get("/users/#{user.id}") }
    it 'should have a http success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders corret page template' do
      expect(response.body).to include('John')
  end

  it 'renders show tempate' do
    expect(response).to render_template(:show)
  end

   
  end
end
