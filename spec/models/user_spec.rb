require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'has many posts' do 
    association = described_class.reflect_on_association(:posts)
    expect(association.macro).to eq(:has_many)
  end


end
