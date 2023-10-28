require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:user){ create(:user)}
  let(:post){create(:post, user: user, title: 'My Title', content: 'Some Text')}
  before(:each) do
    assign(:post, post)
    sign_in(user)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(post), "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "textarea[name=?]", "post[content]"
    end
  end
end
