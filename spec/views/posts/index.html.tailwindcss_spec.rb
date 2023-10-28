require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:user){ create(:user)}
  let(:post){create(:post, user: user)}

  before do 
    assign(:posts, [post, post])
    sign_in(user)
  end

  it "renders a list of posts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
