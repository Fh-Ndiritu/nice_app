require 'rails_helper'

RSpec.describe "Post Features", type: :feature do 
    let(:user){create(:user)}
    let(:post1){ create(:post, user: user, title: 'Post 1')}
    let(:post2){ create(:post, user: user, title: 'Post 2')}

    before do 
        sign_in(user)
        post1 
        post2
        visit posts_path
    end

    it 'displays the name of the page' do 
        expect(page).to have_content('Recent Posts')
    end

    it 'links to new post page' do 
        click_link("New post")
        expect(current_path).to eq('/posts/new')
        expect(page).to have_content('Add a Post')
    end

    it 'lists all of the posts' do 
        expect(page).to have_content('Post 1')
        expect(page).to have_content('Post 2')
    end

    it 'adds a post to list of posts' do 
        click_link('New post')
        expect(current_path).to have_content('/posts/new')

        fill_in('Title', with: 'Lorem')
        fill_in('Content', with: 'Some random latin text')
        click_button('Create')
        expect(page).to have_content('Lorem')
        expect(current_path).to have_content('/posts/')
    
    end

end