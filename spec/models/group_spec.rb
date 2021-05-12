require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'validates tests' do
    it 'ensures presence for name of the group' do
      group = Group.new(icon: 'https://storage.googleapis.com/website-production/uploads/2018/11/facebook-link-format.jpg').save
      expect(group).to eq(false)
    end

    it 'ensures presence for the icon of the group' do
      group = Group.new(name: 'diamond').save
      expect(group).to eq(false)
    end
  end
end

context 'Association tests' do

  it 'should belong to user' do
    group = Group.reflect_on_association(:user).macro
    expect(group).to eq(:belongs_to)
  end

  it 'should have many deposits' do
    group = Group.reflect_on_association(:deposits).macro
    expect(group).to eq(:has_many)
  end

  it 'should have many grouped_payments' do
    group = Group.reflect_on_association(:grouped_payments).macro
    expect(group).to eq(:has_many)
  end
end