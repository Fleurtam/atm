require './lib/account.rb'

describe Account do
  it 'is expected to have a 4 digit pincode' do
    pin_length = Math.log10(subject.pin_code).to_i + 1
    expect(pin_length).to eq 4
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'is expected to have an expiry date on initialize' do
    expected_date =
      Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
    expect(subject.exp_date).to eq expected_date
  end
end
