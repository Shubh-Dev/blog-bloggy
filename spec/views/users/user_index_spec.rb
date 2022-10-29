require 'rails_helper'

RSpec.describe 'user', type: :system do
  describe 'user index page' do
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
  end
end
