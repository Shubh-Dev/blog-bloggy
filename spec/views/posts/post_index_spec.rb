require 'rails_helper'

RSpec.describe 'post', type: :system do
  describe 'post index page' do
    before :all do
      @user = User.create(name: 'Victor', photo: 'https://i.imgur.com/1J8mYQJ.jpg',
                          bio: 'I am a software developer', posts_counter: 0)
      @post = Post.create(title: 'Post 1', text: 'This is a post', user: @user)
    end
    after :all do
      @user.destroy
      @post.destroy
    end

    it 'I can see the user\'s profile picture' do
      visit user_posts_path(@user)
      expect(page).to have_css("img[src='https://i.imgur.com/1J8mYQJ.jpg']")
    end

    it 'I can see the user\'s name' do
      visit user_posts_path(@user)
      expect(page).to have_content('Victor')
    end

    it 'I can see the number of posts the use has written' do
      visit user_posts_path(@user)
      expect(page).to have_content('Posts: 1')
    end

    it 'I can see the post\'s title' do
      visit user_posts_path(@user)
      expect(page).to have_content('Post 1')
    end

    it 'I can see the post\'s text' do
      visit user_posts_path(@user)
      expect(page).to have_content('This is a post')
    end

    it 'I can see see some comments' do
      visit user_posts_path(@user)
      expect(page).to have_content('Comments')
    end

    it 'I can see how many comments the post has' do
      visit user_posts_path(@user)
      expect(page).to have_content('Comments: 0')
    end

    it 'I can see section of pagination if there' do
      visit user_posts_path(@user)
      expect(page).not_to have_content('Pagination')
    end

    it 'When I click a post it redirects me to the post show page' do
      visit user_posts_path(@user)
      click_link('Post No: 1')
      expect(page).to have_current_path(user_post_path(@user, @post))
    end
  end
end
