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

context 'Association tests' do
  it 'should belong to author' do
    deposit = Deposit.reflect_on_association(:author).macro
    expect(deposit).to eq(:belongs_to)
  end

  it 'should have many grouped_payments' do
    deposit = Deposit.reflect_on_association(:grouped_payments).macro
    expect(deposit).to eq(:has_many)
  end

  it 'should have many groups' do
    deposit = Deposit.reflect_on_association(:groups).macro
    expect(deposit).to eq(:has_many)
  end
end
