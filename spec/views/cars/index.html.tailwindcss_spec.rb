require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        model: "Model",
        brand: "Brand",
        power: 2,
        color: "Color",
        seat_capacity: 3,
        description: "MyText",
        price: 4,
        location: "Location"
      ),
      Car.create!(
        model: "Model",
        brand: "Brand",
        power: 2,
        color: "Color",
        seat_capacity: 3,
        description: "MyText",
        price: 4,
        location: "Location"
      )
    ])
  end

  it "renders a list of cars" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Model".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Brand".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Color".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Location".to_s), count: 2
  end
end
