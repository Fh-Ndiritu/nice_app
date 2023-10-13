require 'rails_helper'

RSpec.describe Post, type: :model do 
  it 'is valid with correct parameters' do 
    subject = build(:post)
    expect(subject).to be_valid
  end

  it 'is invalid without title' do 
    subject = build(:post, title: nil)
    expect(subject).to_not be_valid
  end

  it 'is invalid without content' do 
    subject = build(:post, content: nil)
    expect(subject).to_not be_valid
  end

  it 'is invalid without minimum length' do 
    subject = build(:post, content: 'He')
    expect(subject).to_not be_valid
  end

  it 'returns a post summary' do 
    subject = build(:post, content: "This is some very very very long text input")
    expect(subject.summary).to eq("This is some very ve...")
  end


end

