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

        it 'when click on a user name, it goes to user show page' do
            visit users_path
            user = User.first
            click_link(name: 'Shubh')
            expect(page.current_path).to eq user_path('/users/1')
        end
    end
end
 