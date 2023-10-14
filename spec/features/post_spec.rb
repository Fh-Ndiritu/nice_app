require 'rails_helper'

RSpec.describe "Post Features", type: :feature do 
    let(:user){create(:user)}
    before do 
        sign_in(user)
        visit posts_path
    end

    it 'displays the name of the page' do 
        expect(page).to have_content('Recent Posts')
    end

    it 'links to new post page' do 
        click_link("New post")
        expect(current_path).to eq('/posts/new')
    end
end