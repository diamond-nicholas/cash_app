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
