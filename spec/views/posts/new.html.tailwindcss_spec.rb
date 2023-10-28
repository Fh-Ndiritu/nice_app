require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  let(:user){ create(:user) }
  let(:post){ create(:post, user: user) }
  before(:each) do
    assign(:post, post)
    sign_in(user)
    render
  end

  it "renders new post form" do
    expect(rendered).to have_selector("form[class='contents'][method='post']") do 
      expect(rendered).to have_field("post[title]", type: "text")
      expect(rendered).to have_field("post[content]", type: "textarea")
    end
  end
end
