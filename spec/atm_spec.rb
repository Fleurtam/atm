require './lib/atm.rb'
require 'date'

describe Atm do
  let(:account) { instance_double('Account') }
  before do
    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end

  it 'Allow withdraw if account has enough balance.' do
    expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
    expect(subject.withdraw(45, account)).to eq expected_output
  end

  it 'Has 1000 dollars on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'Funds are reduced at withdrawal' do
    subject.withdraw(50, account)
    expect(subject.funds).to eq 950
  end

  it 'Rejects withdraw if account has insuffient funds' do
    expected_output = { status: false, message: 'insuffient funds', date: Date.today }
    expect(subject.withdraw(1005, account)).to eq expected_output
  end
end
