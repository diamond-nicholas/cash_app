require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(email: 'diamond@gmail.com', password: 123_456_789).save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(name: 'nicholas', password: 123_456_789).save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(name: 'nicholas', email: 'diamond@gmail.com', password: 123_456_789).save
      expect(user).to eq(false)
    end
  end
end

context 'Association tests' do
  it 'should have many groups' do
    user = User.reflect_on_association(:groups).macro
    expect(user).to eq(:has_many)
  end

  it 'should have many authoured_deposits' do
    user = User.reflect_on_association(:authored_deposits).macro
    expect(user).to eq(:has_many)
  end
end