require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  let(:car) {
    Car.create!(
      model: "MyString",
      brand: "MyString",
      power: 1,
      color: "MyString",
      seat_capacity: 1,
      description: "MyText",
      price: 1,
      location: "MyString"
    )
  }

  before(:each) do
    assign(:car, car)
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(car), "post" do

      assert_select "input[name=?]", "car[model]"

      assert_select "input[name=?]", "car[brand]"

      assert_select "input[name=?]", "car[power]"

      assert_select "input[name=?]", "car[color]"

      assert_select "input[name=?]", "car[seat_capacity]"

      assert_select "textarea[name=?]", "car[description]"

      assert_select "input[name=?]", "car[price]"

      assert_select "input[name=?]", "car[location]"
    end
  end
end
