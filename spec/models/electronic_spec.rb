require 'rails_helper'

RSpec.describe Electronic, type: :model do

  describe 'it has validations' do 
    it 'has a name' do 
      electronic = build(:electronic, name: nil)
      expect(electronic.valid?).to be(false)
      expect(electronic.errors["name"]).to include("can't be blank")
    end

    it 'has a name longer than 4 ' do 
      electronic = build(:electronic, name: 'ab')
      expect(electronic.valid?).to be(false)
      expect(electronic.errors["name"]).to include(/too short/)
    end

    it 'is shorter than 70 characters ' do 
      electronic = build(:electronic, name: Faker::Lorem.characters(number: 100))
      expect(electronic.valid?).to be(false)
      expect(electronic.errors['name']).to include(/too long/)
    end
  end


  describe 'it has associations' do 
    it 'belongs to a company' do 
      association = described_class.reflect_on_association(:store)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
