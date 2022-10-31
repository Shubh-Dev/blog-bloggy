require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    let(:user) do
      User.create!(
        name: 'John',
        photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
        bio: 'I am a software developer',
        posts_counter: 0
      )
    end
    before(:example) { get("/users/#{user.id}/posts") }
    it 'should have a http success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders corret page template' do
      expect(response.body).to include('John')
    end

    it 'renders index tempate' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    let(:user) do
      User.create!(
        name: 'John',
        photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
        bio: 'I am a software developer',
        posts_counter: 0
      )
    end
    let(:post) do
      Post.create!(
        title: 'My first post',
        text: 'This is a post',
        author_id: user.id
      )
    end
    before(:example) { get("/users/#{user.id}/posts/#{post.id}") }
    it 'should have a http success status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders corret page template' do
      expect(response.body).to include('This is a post')
    end

    it 'renders show tempate' do
      expect(response).to render_template(:show)
    end
  end
end
