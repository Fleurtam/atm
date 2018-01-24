require './lib/account.rb'

describe Account do

  it 'is expected to have a 4 digit pincode' do

    pin_length = Math.log10(subject.pin_code).to_i + 1
    expect(pin_length).to eq 4
  end
end
