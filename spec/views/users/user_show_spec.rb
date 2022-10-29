require 'rails_helper'

RSpec.describe 'user', type: :system do
    describe 'user show page' do
        it 'shows the user show page' do
        visit user_path(1)
        expect(page).to have_content 'Bloggy App'
        end
    
        it 'shows the user show page' do
        visit user_path(1)
        user = User.find(1)
        expect(page).to have_content user.name
        end
    
        it 'we can see photo' do
        visit user_path(1)
        page.has_selector?('img')
        end
    
        it 'can see number of posts' do
        visit user_path(1)
        user = User.find(1)
        expect(page).to have_content user.posts.count
        end
    end
    end