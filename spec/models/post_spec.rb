require 'rails_helper'

RSpec.describe Post, type: :model do 
  let(:user){ create(:user) }
  
  it 'is valid with correct parameters' do 
    subject = build(:post, user: user)
    expect(subject).to be_valid
  end

  it 'is invalid without title' do 
    subject = build(:post, user: user, title: nil)
    expect(subject).to_not be_valid
  end

  it 'is invalid without content' do 
    subject = build(:post, user: user, content: nil)
    expect(subject).to_not be_valid
  end

  it 'is invalid without minimum length' do 
    subject = build(:post, user: user, content: 'He')
    expect(subject).to_not be_valid
  end

  context 'it has scoped', focus: do 
    it '.returns only active posts' do 
      subject = create(:post, user:user, active: true)
      subject2 = create(:post, user:user, active: false)
      expect(described_class.active).to include(subject)
      expect(described_class.active).to_not include(subject2)
    end

  end


  context 'it has custom methods' do 
    it 'returns a post summary' do 
      subject = build(:post, user: user, content: "This is some very very very long text input")
      expect(subject.summary).to eq("This is some very ve...")
    end
  end


  context 'it has associations ' do 
    it 'belongs to a user' do 
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end
  end


end

