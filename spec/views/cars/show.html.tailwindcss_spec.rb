require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    assign(:car, Car.create!(
      model: "Model",
      brand: "Brand",
      power: 2,
      color: "Color",
      seat_capacity: 3,
      description: "MyText",
      price: 4,
      location: "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Location/)
  end
end
