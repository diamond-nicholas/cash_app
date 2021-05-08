require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(email: 'diamond@gmail.com', password: 123456789).save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(name: 'nicholas', password: 123456789).save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(name: 'nicholas', email: 'diamond@gmail.com', password: 123456789).save
      expect(user).to eq(true)
    end
  end

  context 'scope tests' do
  end
end
