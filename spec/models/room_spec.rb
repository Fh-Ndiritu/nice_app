require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:room){ create(:room)}

  describe 'validations' do 
    it 'has a unique name' do 
      create(:room, name: 'test')
      new_room = build(:room, name: 'test')
      expect(new_room.valid?).to be(false) do 
        expect(new_room.errors[:name]).to include("has already been taken")
      end
      
    end
  end

  describe 'scopes', focus: do 
    it 'has public scope' do 
      pri_room = create(:room, is_private: true)
      pub_room = create(:room, name: "Public")

      expect(described_class.public_rooms).to include(pub_room)
      expect(described_class.public_rooms).to_not include(pri_room)
    end
  end
end
