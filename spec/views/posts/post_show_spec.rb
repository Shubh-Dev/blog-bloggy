require 'rails_helper'

RSpec.describe 'post', type: :system do
  describe 'post show page' do
    before :all do
      @user = User.create(name: 'Victor', photo: 'https://i.imgur.com/1J8mYQJ.jpg',
                          bio: 'I am a software developer', posts_counter: 0)
      @post = Post.create(title: 'Post 1', text: 'This is a post', user: @user)
    end
    after :all do
      @user.destroy
      @post.destroy
    end

    it 'I can see post\'s title' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Post 1')
    end

    it 'I can see who wrote the post' do
      visit user_post_path(@user, @post)
      expect(page).not_to have_content('booom')
    end

    it 'I can see how many comments the post has' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Comments: 0')
    end

    it 'I can see how many likes the post has' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Likes: 0')
    end

    it 'I can see the post\'s text' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('This is a post')
    end

    it 'I can see the post\'s comments' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Comments')
    end
  end
end
