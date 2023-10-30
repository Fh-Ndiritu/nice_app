require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:user){ create(:user)}
  let(:post){create(:post, user: user, title: 'My Title', content: 'Some Text')}
  before(:each) do
    assign(:post, post)
    sign_in(user)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/My Title/)
    expect(rendered).to match(/Some Text/)
  end
end
