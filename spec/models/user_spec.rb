require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'has many posts' do 
    association = described_class.reflect_on_association(:posts)
    expect(association.macro).to eq(:has_many)
  end

  describe 'it has associations' do 
    it 'has belongs to a company' do 
      association = described_class.reflect_on_association(:store)
      expect(association.macro).to eq(:belongs_to)
    end
   
  end


end
