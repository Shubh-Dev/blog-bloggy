require 'rails_helper'

RSpec.describe 'user', type: :system do
  describe 'user index page' do
    before :all do
      @user = User.create(name: 'Victor', photo: 'https://i.imgur.com/1J8mYQJ.jpg',
                          bio: 'I am a software developer', posts_counter: 0)
    end

    after :all do
      @user.destroy
    end

    it 'shows the user index page' do
      visit users_path
      expect(page).to have_content 'Bloggy App'
    end

    it 'shows the user index page' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_content user.name
      end
    end

    it 'we can see photo' do
      visit users_path
      page.has_selector?('img')
    end

    it 'can see number of posts' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_content user.posts.count
      end
    end

    it 'user can redirect to the posts they made' do
      visit users_path
      click_link @user.name
      expect(page).to have_content 'Total Post: 0'
    end
  end
end
