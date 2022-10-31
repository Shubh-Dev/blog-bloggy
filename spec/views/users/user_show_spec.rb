require 'rails_helper'

RSpec.describe 'user', type: :system do
  describe 'user show page' do
    before :all do
      @user = User.create(name: 'Victor', photo: 'https://i.imgur.com/1J8mYQJ.jpg',
                          bio: 'I am a software developer', posts_counter: 0)
    end
    after :all do
      @user.destroy
    end

    it 'shows the user name' do
      visit user_path(@user)
      expect(page).to have_content(@user.name)
    end

    it 'shows the user photo' do
      visit user_path(@user)
      expect(page).to have_css("img[
            src='https://i.imgur.com/1J8mYQJ.jpg']")
    end

    it 'shows the user bio' do
      visit user_path(@user)
      expect(page).to have_content(@user.bio)
    end

    it 'I can see the number of posts' do
      visit user_path(@user)
      expect(page).to have_content('Total Post: 0')
    end

    it 'I can see user\'s first three posts' do
      visit user_path(@user)
      expect(page).to have_no_content('Post 1')
    end

    it 'I can see button to see all posts' do
      visit user_path(@user)
      expect(page).to have_link('See all posts')
    end

    it 'when I click a user\s post I am redirected to the post show page' do
      visit user_path(@user)
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
