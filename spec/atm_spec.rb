require './lib/atm.rb'

describe Atm do
  let(:account) { instance_double('Account', pin_code: '1234', exp_date: '04/18') }
  before do
    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end

  it 'Allow withdraw if account has enough balance.' do
    expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
    expect(subject.withdraw(45, '1234', account)).to eq expected_output
  end

  it 'Has 1000 dollars on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'Funds are reduced at withdrawal' do
    subject.withdraw(50, '1234', account)
    expect(subject.funds).to eq 950
  end

  it 'Rejects withdraw if account has insuffient funds' do
    expected_output = { status: false, message: 'insuffient funds', date: Date.today }
    expect(subject.withdraw(1005, '1234', account)).to eq expected_output
  end

  it 'Rejects withdraw if ATM has insufficient funds' do
    subject.funds = 50
    expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    expect(subject.withdraw(100, '1234', account)).to eq expected_output
  end

  it 'Reject withdraw if pin is wrong' do
    expected_output = { status: false, message: 'wrong pin', date: Date.today }
    expect(subject.withdraw(50, 9999, account)).to eq expected_output
  end

  it 'Reject withdraw if card is expired' do
    allow(account).to receive(:exp_date).and_return('12/15')
    expected_output = { status: false, message: 'card expired', date: Date.today }
    expect(subject.withdraw(6, '1234', account)).to eq expected_output
  end

end
