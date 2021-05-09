require 'rails_helper'

RSpec.describe Deposit, type: :model do
  context 'validation tests' do
    it 'ensures presence for name of deposit' do
      deposit = Deposit.new(amount: 500).save
      expect(deposit).to eq(false)
    end

    it 'ensures presence for amount deposited' do
      deposit = Deposit.new(name: 'diamond').save
      expect(deposit).to eq(false)
    end

    it 'should not save successfully' do
      deposit = Deposit.new(name: 'diamond', amount: 500, author_id: 1).save
      expect(deposit).to eq(false)
    end
  end
end
