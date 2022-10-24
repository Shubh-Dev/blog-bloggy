require 'rails_helper'

RSpec.describe 'Posts', type: :request do
    describe 'GET /posts' do
            before(:example) { get user_posts_path('1') }
           it 'works! (now write some real specs)' do
                get user_posts_path
                expect(response).to have_http_status(200)
            end
    
            it 'returns the status :ok' do
                get user_posts_path
                expect(response).to have_http_status(:ok)
            end
    
            it 'includes correct text' do
                get user_posts_path
                expect(response.body).to include('All the post of a user goes here')
            end  

            it 'renders the index template' do
                get user_posts_path
                expect(response).to render_template('index')
            end
    end

    describe 'GET /show' do
        before(:example) { get user_post_path('1', '1') }
        it 'renders the show template' do
            get user_post_path('1')
            expect(response).to render_template('show') 
        end
        it 'return status :ok' do
            get user_post_path('1')
            expect(response).to have_http_status(:ok)
        end

        it 'includes correct text' do
            get user_post_path('1')
            expect(response.body).to include('A single post with comments and likes goes here')
        end
    end


end