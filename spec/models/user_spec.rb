require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'test name', photo: 'test photo', bio: 'test bio', posts_counter: 0) }
  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is posts_counter is not valid ' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter value is  umber' do
    expect(subject.posts_counter).to be_an(Integer)
  end

  it 'posts_counter is more than or equal to 0' do
    expect(subject.posts_counter).to be >= 0
  end

  it 'photo is not mandatory' do
    subject.photo = nil
    expect(subject).to be_valid
  end
end
