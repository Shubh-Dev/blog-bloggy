require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new(title: 'title', text: 'text', comments_counter: 4, likes_counter: 2) }
  before { subject.save }

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a text' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'title must not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter is a integer' do
    expect(subject.comments_counter).to be_an(Integer)
  end

  it 'comments_counter is more than or equal to 0' do
    expect(subject.comments_counter).to be >= 0
  end

  it 'likes_counter is a integer' do
    expect(subject.likes_counter).to be_an(Integer)
  end

  it 'likes_counter is more than or equal to 0' do
    expect(subject.likes_counter).to be >= 0
  end
end
