require 'rails_helper'

RSpec.describe Store, type: :model do
  describe 'it has validations' do 
    it 'has a name' do 
      store = build(:store, name: nil)
      expect(store.valid?).to be(false)
      expect(store.errors["name"]).to include(/can't be blank/)
    end
  end


  describe 'it has associations' do 
    it 'has many users' do 
      association = described_class.reflect_on_association(:users)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many electronics' do 
      association = described_class.reflect_on_association(:electronics)
      expect(association.macro).to eq(:has_many)
    end

    
  end
end
